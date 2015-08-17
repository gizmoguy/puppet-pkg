require 'spec_helper'

describe 'pkg::install', :type => :class do
  ['Debian', 'Redhat'].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
        :osfamily => distro,
        :lsbdistid => distro
      }}

      context "install package" do
        let( :params ) {{
          :packages => ['vim'],
        }}

        it do
          should contain_package( 'vim' ).with({
            'ensure' => 'installed'
          })
        end
      end

      context "install packages" do
        let( :params ) {{
          :packages => ['vim', 'htop'],
        }}

        it do
          should contain_package( 'vim' ).with({
            'ensure' => 'installed'
          })
        end

        it do
          should contain_package( 'htop' ).with({
            'ensure' => 'installed'
          })
        end
      end
    end
  end
end

describe 'pkg::uninstall', :type => :class do
  ['Debian', 'Redhat'].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
        :osfamily => distro,
        :lsbdistid => distro
      }}

      context "uninstall package" do
        let( :params ) {{
          :packages => ['vim'],
        }}

        it do
          should contain_package( 'vim' ).with({
            'ensure' => 'absent'
          })
        end
      end

      context "uninstall packages" do
        let( :params ) {{
          :packages => ['vim', 'htop'],
        }}

        it do
          should contain_package( 'vim' ).with({
            'ensure' => 'absent'
          })
        end

        it do
          should contain_package( 'htop' ).with({
            'ensure' => 'absent'
          })
        end
      end
    end
  end
end

describe 'pkg::purge', :type => :class do
  ['Debian', 'Redhat'].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
        :osfamily => distro,
        :lsbdistid => distro
      }}

      context "purge package" do
        let( :params ) {{
          :packages => ['vim'],
        }}

        it do
          should contain_package( 'vim' ).with({
            'ensure' => 'purged'
          })
        end
      end

      context "purge packages" do
        let( :params ) {{
          :packages => ['vim', 'htop'],
        }}

        it do
          should contain_package( 'vim' ).with({
            'ensure' => 'purged'
          })
        end

        it do
          should contain_package( 'htop' ).with({
            'ensure' => 'purged'
          })
        end
      end
    end
  end
end

describe 'pkg::upgrade', :type => :class do
  ['Debian', 'Redhat'].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
        :osfamily => distro,
        :lsbdistid => distro
      }}

      context "upgrade package" do
        let( :params ) {{
          :packages => ['vim'],
        }}

        it do
          should contain_package( 'vim' ).with({
            'ensure' => 'latest'
          })
        end
      end

      context "upgrade packages" do
        let( :params ) {{
          :packages => ['vim', 'htop'],
        }}

        it do
          should contain_package( 'vim' ).with({
            'ensure' => 'latest'
          })
        end

        it do
          should contain_package( 'htop' ).with({
            'ensure' => 'latest'
          })
        end
      end
    end
  end
end

describe 'pkg::pin', :type => :class do
  context 'on unsupported distributions' do
    let(:facts) {{ :osfamily => 'Unsupported' }}

    it 'it fails' do
      expect { subject.call }.to raise_error(/is not supported on an Unsupported based system/)
    end
  end

  ['Debian'].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
        :osfamily => distro,
        :lsbdistid => distro,
        :lsbdistcodename => 'wheezy'
      }}

      context "pin package" do
        let( :params ) {{
          :packages => {
            'vim' => {
              'priority' => 50,
              'packages' => 'vim',
              'version'  => '7.3*'
            }
          },
        }}

        it { should contain_apt__pin('vim').with(
          'priority' => 50,
          'packages' => 'vim',
          'version'  => '7.3*'
        )}

        it { should contain_file('vim.pref') \
             .with_path('/etc/apt/preferences.d/vim.pref') \
             .with_content(/Package: vim/) \
             .with_content(/Pin: version 7.3*/) \
             .with_content(/Pin-Priority: 50/)
        }
      end

      context "pin packages" do
        let( :params ) {{
          :packages => {
            'vim' => {
              'priority' => 50,
              'packages' => 'vim',
              'version'  => '7.3*'
            },
            'puppet' => {
              'priority' => 501,
              'packages' => 'puppet puppet-common',
              'version'  => '2.7*'
            }
          },
        }}

        it { should contain_apt__pin('vim') }
        it { should contain_apt__pin('puppet') }

        it { should contain_file('vim.pref') \
             .with_path('/etc/apt/preferences.d/vim.pref') \
             .with_content(/Package: vim/) \
             .with_content(/Pin: version 7.3*/) \
             .with_content(/Pin-Priority: 50/)
        }

        it { should contain_file('puppet.pref') \
             .with_path('/etc/apt/preferences.d/puppet.pref') \
             .with_content(/Package: puppet puppet-common/) \
             .with_content(/Pin: version 2.7*/) \
             .with_content(/Pin-Priority: 501/)
        }
      end
    end
  end
end
