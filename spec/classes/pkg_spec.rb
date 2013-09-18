require 'spec_helper'

describe 'pkg::install', :type => :class do
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

describe 'pkg::uninstall', :type => :class do
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

describe 'pkg::purge', :type => :class do
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

describe 'pkg::upgrade', :type => :class do
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
