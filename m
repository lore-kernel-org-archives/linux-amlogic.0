Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA80C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Nov 2023 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLnaDfaYflTcZAGGHxn3fSo4dqA0f5mvYXmmkR9x5Ko=; b=COQcpAbfEoYgdI
	loRop8x4VE5L6mpTLab6rTkSq/ARM+FpTfzAAQKKG2NWqvHS0AlJSzDMvNHKmjqaXI4okZ//n3ltJ
	pe2ANDhvTxFoVwmatWK5qkC88lGPBXDAUFGeuitRXH9UR8EsbUF+Qx0b54o2mdP/dRkVmSNp4utQb
	Q6iFq4q6f++JtxB21cK8o5Q6jdqwl5zoF0k+BoOWuYWkbFrbtdQek1ot1Wt9fTh85yyYOzdCSwrDc
	AsY0E5WR1FVBm7iZVtS3Pv34KUwYPvfbkjUMBDi88tkB7QM6SvkozTjQmgdTgoTfdXni8+mbtdXa3
	wl/3gqNoSXMobWr2KCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyhxy-00AVYn-2B;
	Fri, 03 Nov 2023 00:23:14 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyhxt-00AVXj-1F;
	Fri, 03 Nov 2023 00:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698970989; x=1730506989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jRcO1ajPVbh/cusEJQxYTj2Fddx+LSNylJw5TDJVCgc=;
  b=YSzMUwtpqSCkQK6TKQgyR/KUpljbDJomKbl1SuxBOXZVheOmGUz9e7r1
   ka0fi+mqF59Hu5dJfhSldvVJdx65mLeX394dnVqWSLJGccDk81dpRCU13
   4WZbokACeSgLuS8TQgDwQadgpSXkyIjZ8IlyYwsZkp3F8gm6LWs1xkcnr
   iE0v9b0OTuPzv2hQ/X9tZcBJWPwItjrLV1DnlJfnhQRXWZ/hYHmh+NhWZ
   8K/cjkfc9W3t6JI3wU3MI5TGQvh7uEur57sb/8RX3AEAltUGIQo8XW99K
   xM7v73RgDG/j3bXALhQBHWs9+JmQdpQhGF1Ch7MIocvCVS1xOKERaQ6I3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391718703"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="391718703"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008651143"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="1008651143"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 17:22:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyhxe-000238-1P;
	Fri, 03 Nov 2023 00:22:54 +0000
Date: Fri, 3 Nov 2023 08:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Bocharov <adeep@lexina.in>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/4] firmware: meson_sm: use meson_gx_socinfo for
 compatibility
Message-ID: <202311030839.2qiIuOUl-lkp@intel.com>
References: <20231102074916.3280809-5-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102074916.3280809-5-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_172309_473371_D422E969 
X-CRM114-Status: GOOD (  18.28  )
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

Hi Viacheslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.6 next-20231102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Bocharov/firmware-meson-sm-change-sprintf-to-scnprintf/20231102-172556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20231102074916.3280809-5-adeep%40lexina.in
patch subject: [PATCH 4/4] firmware: meson_sm: use meson_gx_socinfo for compatibility
config: arm64-randconfig-003-20231103 (https://download.01.org/0day-ci/archive/20231103/202311030839.2qiIuOUl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030839.2qiIuOUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030839.2qiIuOUl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/meson/meson_sm.c: In function 'chipid_show':
>> drivers/firmware/meson/meson_sm.c:328:19: error: 'uint32' undeclared (first use in this function); did you mean 'uint32_t'?
     328 |                 ((uint32)t *)buff)[0] = 0;
         |                   ^~~~~~
         |                   uint32_t
   drivers/firmware/meson/meson_sm.c:328:19: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/firmware/meson/meson_sm.c:328:26: error: expected ')' before 't'
     328 |                 ((uint32)t *)buff)[0] = 0;
         |                 ~        ^
         |                          )
>> drivers/firmware/meson/meson_sm.c:328:30: error: expected ';' before 'buff'
     328 |                 ((uint32)t *)buff)[0] = 0;
         |                              ^~~~
         |                              ;
>> drivers/firmware/meson/meson_sm.c:328:34: error: expected statement before ')' token
     328 |                 ((uint32)t *)buff)[0] = 0;
         |                                  ^
>> drivers/firmware/meson/meson_sm.c:328:35: error: expected expression before '[' token
     328 |                 ((uint32)t *)buff)[0] = 0;
         |                                   ^
   drivers/firmware/meson/meson_sm.c:331:17: error: 'ch' undeclared (first use in this function)
     331 |                 ch = (uint8_t *)(id_buf + 4);
         |                 ^~
   drivers/firmware/meson/meson_sm.c:332:22: error: 'i' undeclared (first use in this function)
     332 |                 for (i = 0; i < 12; i++)
         |                      ^


vim +328 drivers/firmware/meson/meson_sm.c

   281	
   282	static ssize_t chipid_show(struct device *dev, struct device_attribute *attr,
   283				 char *buf)
   284	{
   285		struct platform_device *pdev = to_platform_device(dev);
   286		struct meson_sm_firmware *fw;
   287		uint8_t *id_buf;
   288		int ret;
   289	
   290		fw = platform_get_drvdata(pdev);
   291	
   292		id_buf = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
   293		if (!id_buf)
   294			return -ENOMEM;
   295	
   296		ret = meson_sm_call_read(fw, id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
   297					 2, 0, 0, 0, 0);
   298		if (ret < 0) {
   299			kfree(id_buf);
   300			return ret;
   301		}
   302	
   303		int version = *((unsigned int *)id_buf);
   304	
   305		if (version == 2)
   306			ret = scnprintf(buf, PAGE_SIZE, "%16phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
   307		else {
   308			/**
   309			 * Legacy 12-byte chip ID read out, transform data
   310			 * to expected order format.
   311			 */
   312			uint8_t *buff;
   313	
   314			buff = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
   315			if (!buff)
   316				return -ENOMEM;
   317	#ifdef CONFIG_MESON_GX_SOCINFO
   318			uint8_t *ch;
   319			int i;
   320	
   321			((uint32_t *)buff)[0] =
   322				((meson_gx_socinfo & 0xff000000)        |       // Family ID
   323				((meson_gx_socinfo << 8) & 0xff0000)    |       // Chip Revision
   324				((meson_gx_socinfo >> 8) & 0xff00));            // Package ID
   325	
   326			((uint32_t *)buff)[0] = htonl(((uint32_t *)buff)[0]);
   327	#else
 > 328			((uint32)t *)buff)[0] = 0;
   329	#endif
   330			/* Transform into expected order for display */
   331			ch = (uint8_t *)(id_buf + 4);
   332			for (i = 0; i < 12; i++)
   333				buff[i + 4] = ch[11 - i];
   334			ret = scnprintf(buf, PAGE_SIZE, "%16phN\n", &buff);
   335			kfree(buff);
   336		}
   337	
   338		kfree(id_buf);
   339		return ret;
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
