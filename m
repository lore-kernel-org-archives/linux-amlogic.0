Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE08C38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dyHWBTYHp+tPBaKVafTTwW1zFricLEU21BIWwYcgsE=; b=gqecsL/ygiiAIf
	mtGrFPegfQwcbXZWlhtSMA/Pu3VdoGTjDaso2tRA9V4bQFXB+z+tvVV+c9CJ2SoJilo3vmXhuAQO4
	YYdd7dhsLrT8pDLX+PTQF85n4Pn5lXSD1/s8q10fTu5hSc5SqeckgFcG3YrLHDCPbs5icc0t375cg
	JoiodTEzA/BkAtvqM9lrZKrppJBGwChjb3K/alQ27GA+34vQUsmrkQdcZaxhVEfTfZpTiWQb+QYut
	Ih/xsSgyrIMje1H0bmAaHIosJYS5s0m/kBCSMRpSGJYKvpdExqdLZPsV+U11eEzjYc4iXr4/uWjS2
	IUy+aFDtXmfGbSsqobFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzlW-000ZjU-87; Mon, 23 Jan 2023 16:33:50 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzXY-000Uc7-JV; Mon, 23 Jan 2023 16:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674490764; x=1706026764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lmu2v7OpTbu6dqk7bQ9CsXmK8c+nQata6XlQ8c9vCME=;
  b=QZKaX3sdlGqa3vF1NBaIswr7IUkHusRbPvvLpGkSapvxctg9paYRcyad
   eejwH9pUTEH/93vJNVRXzcvjn4seVKR0pvB/RiMeCZC3goq1QJyPsKhc0
   TVI7eTxuN/pJOb6RHKNOXmD5iJFZzUt57zFwiNI2OdWD/EhyId3eAd3Kr
   fkrhIyWu9DwwpGQ4VKGqp7PLNSobETHhf4Wc4dvPLeopsxUAn8BDzUOu1
   sUvF/5mWBqZIcrlT/Jw12ZFemMRivHzE/ZKoBnTaLMvKuB/XHMNPx8g+d
   mIgWT/4oKNMZ5hBlEIQyb/W/RSIVPBVQ/m8cyA+0WG3WvvNtFqggupgRU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327340450"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="327340450"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 08:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663690168"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663690168"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 08:19:17 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJzXN-0005lU-1V;
	Mon, 23 Jan 2023 16:19:13 +0000
Date: Tue, 24 Jan 2023 00:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: meson: vdec: add HEVC decode codec
Message-ID: <202301240007.NkZA19qq-lkp@intel.com>
References: <20230123133113.3254659-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230123133113.3254659-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_081924_767203_AFEDE20B 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-media@vger.kernel.org, Benjamin Roszak <benjamin545@gmail.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.2-rc5 next-20230123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/media-meson-vdec-implement-10bit-bitstream-handling/20230123-213323
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230123133113.3254659-3-christianshewitt%40gmail.com
patch subject: [PATCH 2/2] media: meson: vdec: add HEVC decode codec
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301240007.NkZA19qq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/498d420e9c7cdc6e694be643c47ee69c8b5b2142
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Hewitt/media-meson-vdec-implement-10bit-bitstream-handling/20230123-213323
        git checkout 498d420e9c7cdc6e694be643c47ee69c8b5b2142
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/staging/media/meson/vdec/codec_hevc.c: In function 'codec_hevc_set_mpred_mv':
>> drivers/staging/media/meson/vdec/codec_hevc.c:1002:13: warning: variable 'val' set but not used [-Wunused-but-set-variable]
    1002 |         u32 val;
         |             ^~~


vim +/val +1002 drivers/staging/media/meson/vdec/codec_hevc.c

   990	
   991	static void codec_hevc_set_mpred_mv(struct amvdec_core *core,
   992					    struct codec_hevc *hevc,
   993					    struct hevc_frame *frame,
   994					    struct hevc_frame *col_frame)
   995	{
   996		union rpm_param *param = &hevc->rpm_param;
   997		u32 lcu_size_log2 = ilog2(hevc->lcu_size);
   998		u32 mv_mem_unit = lcu_size_log2 == 6 ? 0x200 :
   999				  lcu_size_log2 == 5 ? 0x80 : 0x20;
  1000		dma_addr_t col_mv_rd_start_addr, col_mv_rd_ptr, col_mv_rd_end_addr;
  1001		dma_addr_t mpred_mv_wr_ptr;
> 1002		u32 val;
  1003	
  1004		val = amvdec_read_dos(core, HEVC_MPRED_CURR_LCU);
  1005	
  1006		col_mv_rd_start_addr = codec_hevc_get_frame_mv_paddr(hevc, col_frame);
  1007		mpred_mv_wr_ptr = codec_hevc_get_frame_mv_paddr(hevc, frame) +
  1008				  (hevc->slice_addr * mv_mem_unit);
  1009		col_mv_rd_ptr = col_mv_rd_start_addr +
  1010				(hevc->slice_addr * mv_mem_unit);
  1011		col_mv_rd_end_addr = col_mv_rd_start_addr +
  1012				     (hevc->lcu_total * mv_mem_unit);
  1013	
  1014		amvdec_write_dos(core, HEVC_MPRED_MV_WR_START_ADDR,
  1015				 codec_hevc_get_frame_mv_paddr(hevc, frame));
  1016		amvdec_write_dos(core, HEVC_MPRED_MV_RD_START_ADDR,
  1017				 col_mv_rd_start_addr);
  1018	
  1019		if (param->p.slice_segment_address == 0) {
  1020			amvdec_write_dos(core, HEVC_MPRED_ABV_START_ADDR,
  1021					 hevc->workspace_paddr + MPRED_ABV_OFFSET);
  1022			amvdec_write_dos(core, HEVC_MPRED_MV_WPTR, mpred_mv_wr_ptr);
  1023			amvdec_write_dos(core, HEVC_MPRED_MV_RPTR,
  1024					 col_mv_rd_start_addr);
  1025		} else {
  1026			amvdec_write_dos(core, HEVC_MPRED_MV_RPTR, col_mv_rd_ptr);
  1027		}
  1028	
  1029		amvdec_write_dos(core, HEVC_MPRED_MV_RD_END_ADDR, col_mv_rd_end_addr);
  1030	}
  1031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
