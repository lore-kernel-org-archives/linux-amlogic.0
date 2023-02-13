Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6895EC636D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 01:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwMxAcKxYeydrym154zbg9i3hEKmFI+hxUKvD/a2SyY=; b=cg49n0bqJbxXkb
	q20H8b5sypy2slknd1ZukpSrdZZwX/LhdT0Rb1fVCJgAskhXYn5LsXdeBCA7FYQYnkr9g0CgnbzYR
	BwVdoMts8Kfe7fiTk0irGbW2Sar93yJARjJhPc+fma5uQQeKbTgKD00I3PHA2ebU/wTXGP0U8ylJq
	mVU2GaT2NgdejjIDCjcNJOxQzGvOdBzufs+NSo43kthVyl5KZhrx0/KnBxslLYI2mSbbAxSsuA/OT
	jJnbGJz4+GEQLgW0LuXZtMlm/oBLmiEfkJ9N6uS6Bzrrag/pbSptW3uCSzJ8GFflbYLiUh5nZK5id
	29ONgeinosoOMxqwfJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNKP-00Ciq5-Kr; Mon, 13 Feb 2023 01:08:21 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNKE-00Cint-Kj; Mon, 13 Feb 2023 01:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676250490; x=1707786490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pA1qXJwO9D1if1KoXLjnfNNvdLy0H8+OnIFWl2Z64Zc=;
  b=UyuhPcrHitweGsv3VBeHR05miCDVurfEW2DDQwBuKG+cd5tln+MY+FsV
   mj5W/IUxRi7lOMhTdbHcWUUKYSJePpJ3MVr1P4PQx2fMiTV0xUdLaAwNI
   v4iYvJHzvMMYBkuieoSen/BB9JD9loP+cgj1LhwlxCVKi7dABxrutW/h4
   RF8EQQ9TDJ1nKuHxNxfgoHWe3M+Zcv8BFeVSnlG/JfyTwQvGfkAGdWA8M
   OLvlzGylblQ6mKyWWb7LJQ/7XsEXYrBnF5IY6X9ZKa/HMJCztgJClcIFZ
   FgymPT5K3ydsUnQhCaaAAVVf7aG/ggRQRYWLN5MP0r1ViipXS56rm1t1R
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="329408400"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="329408400"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 17:08:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="811418912"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="811418912"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2023 17:08:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRNK3-0007Tf-20;
	Mon, 13 Feb 2023 01:07:59 +0000
Date: Mon, 13 Feb 2023 09:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: fix SDIO mode if cap_sdio_irq isn't set
Message-ID: <202302130924.CSStKyHP-lkp@intel.com>
References: <9e296859-0363-ecc4-2d99-fd0239efceff@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e296859-0363-ecc4-2d99-fd0239efceff@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_170810_721910_D0098C27 
X-CRM114-Status: GOOD (  15.48  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Heiner,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc8 next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/mmc-meson-gx-fix-SDIO-mode-if-cap_sdio_irq-isn-t-set/20230213-055650
patch link:    https://lore.kernel.org/r/9e296859-0363-ecc4-2d99-fd0239efceff%40gmail.com
patch subject: [PATCH] mmc: meson-gx: fix SDIO mode if cap_sdio_irq isn't set
config: arm64-buildonly-randconfig-r006-20230213 (https://download.01.org/0day-ci/archive/20230213/202302130924.CSStKyHP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6aca20b626a6d75b5d74fc4441cdd99ff3252b23
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiner-Kallweit/mmc-meson-gx-fix-SDIO-mode-if-cap_sdio_irq-isn-t-set/20230213-055650
        git checkout 6aca20b626a6d75b5d74fc4441cdd99ff3252b23
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/mmc/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130924.CSStKyHP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/meson-gx-mmc.c:963:5: warning: format specifies type 'unsigned long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
                            irq_mask, raw_status);
                            ^~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +963 drivers/mmc/host/meson-gx-mmc.c

   947	
   948	static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
   949	{
   950		struct meson_host *host = dev_id;
   951		struct mmc_command *cmd;
   952		u32 status, raw_status, irq_mask = IRQ_EN_MASK;
   953		irqreturn_t ret = IRQ_NONE;
   954	
   955		if (host->mmc->caps & MMC_CAP_SDIO_IRQ)
   956			irq_mask |= IRQ_SDIO;
   957		raw_status = readl(host->regs + SD_EMMC_STATUS);
   958		status = raw_status & irq_mask;
   959	
   960		if (!status) {
   961			dev_dbg(host->dev,
   962				"Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
 > 963				 irq_mask, raw_status);
   964			return IRQ_NONE;
   965		}
   966	
   967		if (WARN_ON(!host))
   968			return IRQ_NONE;
   969	
   970		/* ack all raised interrupts */
   971		writel(status, host->regs + SD_EMMC_STATUS);
   972	
   973		cmd = host->cmd;
   974	
   975		if (status & IRQ_SDIO) {
   976			spin_lock(&host->lock);
   977			__meson_mmc_enable_sdio_irq(host->mmc, 0);
   978			sdio_signal_irq(host->mmc);
   979			spin_unlock(&host->lock);
   980			status &= ~IRQ_SDIO;
   981			if (!status)
   982				return IRQ_HANDLED;
   983		}
   984	
   985		if (WARN_ON(!cmd))
   986			return IRQ_NONE;
   987	
   988		cmd->error = 0;
   989		if (status & IRQ_CRC_ERR) {
   990			dev_dbg(host->dev, "CRC Error - status 0x%08x\n", status);
   991			cmd->error = -EILSEQ;
   992			ret = IRQ_WAKE_THREAD;
   993			goto out;
   994		}
   995	
   996		if (status & IRQ_TIMEOUTS) {
   997			dev_dbg(host->dev, "Timeout - status 0x%08x\n", status);
   998			cmd->error = -ETIMEDOUT;
   999			ret = IRQ_WAKE_THREAD;
  1000			goto out;
  1001		}
  1002	
  1003		meson_mmc_read_resp(host->mmc, cmd);
  1004	
  1005		if (status & (IRQ_END_OF_CHAIN | IRQ_RESP_STATUS)) {
  1006			struct mmc_data *data = cmd->data;
  1007	
  1008			if (data && !cmd->error)
  1009				data->bytes_xfered = data->blksz * data->blocks;
  1010			if (meson_mmc_bounce_buf_read(data) ||
  1011			    meson_mmc_get_next_command(cmd))
  1012				ret = IRQ_WAKE_THREAD;
  1013			else
  1014				ret = IRQ_HANDLED;
  1015		}
  1016	
  1017	out:
  1018		if (cmd->error) {
  1019			/* Stop desc in case of errors */
  1020			u32 start = readl(host->regs + SD_EMMC_START);
  1021	
  1022			start &= ~START_DESC_BUSY;
  1023			writel(start, host->regs + SD_EMMC_START);
  1024		}
  1025	
  1026		if (ret == IRQ_HANDLED)
  1027			meson_mmc_request_done(host->mmc, cmd->mrq);
  1028	
  1029		return ret;
  1030	}
  1031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
