Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D93D3C92A
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Oct 2024 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9gQzAwMiTAWlUMtQgjJNUKHj52flIjhDcrmEZ9K1rg=; b=YerdyPIi6mlSPq
	ucxWv4IJCGhxY5kUVqfkLyn5nOTPwmONUNdnXxaeUDGtok2rhDDRpOoLfgt6/1JIX8BAQNMH6+Vxq
	4gzvKLAnrRTBBXmnGP3yXCS5+J4HKWUaLiu2UmptrHJfJfg8cwGaHxlswAXL1o18DHn1+/2HnPF6V
	5NrKXvy1AwA6phG81AoO7T0lgXvH1wtu7EB5kvkw5ztMOH2CIw4Nz1ZpRSfC9INto63iTtpwA+Gmo
	bSI5GscvhQvlr6ZSyNQQ4IpOzVW93tRR/kVXiaet5boRFp+cVuPnA6JwPYkyaHyX3L4yFreDmAM96
	y7KP4YvtEMF92fmvCp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2TQW-00000004l1W-39WR;
	Sun, 20 Oct 2024 10:44:48 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2TQU-00000004l12-0iVP;
	Sun, 20 Oct 2024 10:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729421086; x=1760957086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BlU6SNAVuB+ePlLNf75kQesr0X45PWZmw4zKs7QsWaA=;
  b=Qzr6nK25krT7VWl0CuPaSDtp7v2Fd1ye/fpUcELbreHxPg3P1M60KnDw
   H4TexaMKywy1kW65XP0UFtXCvSUuo2/dLA0otCS5JfdPWf2N9Dc7EIjSP
   SRa5CkkgACsvGkhBziJoO7iVcbB4Lu8EplXrVixyQLCxPwvVP2Zae8NZ4
   UUuBmW9kj86ij1+LPUqat4St/3o3su2bfwU22MCXBSO8dbz6sa2Adfggl
   1fgnEPh2JSgYh05+DHP+XrDFKD9g+7XIKu/eAtLSn7oQGyjHsriadcDgS
   tUcvcaBEN3pVkA4xzarVGObG8etvOAe/3bJ7dp3UjVvZpBz5aW+ZtajHZ
   Q==;
X-CSE-ConnectionGUID: 5M5428K3Q9e9/FkEXAXjhQ==
X-CSE-MsgGUID: W+QgmV5lTJ6Qp4jQB1xHZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="54321252"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="54321252"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 03:44:41 -0700
X-CSE-ConnectionGUID: bSBlRiX2SOu/CEqHAPGTHw==
X-CSE-MsgGUID: bIgfV6zqTKOGZlhOMRHZxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="110018743"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2024 03:44:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2TQK-000QDD-1C;
	Sun, 20 Oct 2024 10:44:36 +0000
Date: Sun, 20 Oct 2024 18:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: George Stark <gnstark@salutedevices.com>,
	u.kleine-koenig@pengutronix.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pwm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com, George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v2 1/4] pwm: meson: Simplify get_state() callback
Message-ID: <202410201612.QJbPOweL-lkp@intel.com>
References: <20241016152553.2321992-2-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016152553.2321992-2-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_034446_282073_B355546F 
X-CRM114-Status: GOOD (  11.06  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi George,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Stark/pwm-mes=
on-Simplify-get_state-callback/20241016-232751
base:   linus/master
patch link:    https://lore.kernel.org/r/20241016152553.2321992-2-gnstark%4=
0salutedevices.com
patch subject: [PATCH v2 1/4] pwm: meson: Simplify get_state() callback
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241020=
/202410201612.QJbPOweL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241020/202410201612.QJbPOweL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201612.QJbPOweL-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/pwm/pwm-meson.c: In function 'meson_pwm_get_state':
>> drivers/pwm/pwm-meson.c:312:35: warning: variable 'channel' set but not =
used [-Wunused-but-set-variable]
     312 |         struct meson_pwm_channel *channel;
         |                                   ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=3Dn]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=3Dm] && RUNTIME_TESTING_MENU [=3Dy] && KUNIT [=
=3Dm]


vim +/channel +312 drivers/pwm/pwm-meson.c

c375bcbaabdb92 Martin Blumenstingl 2019-06-12  306  =

6c452cff79f8bf Uwe Kleine-K=F6nig    2022-12-02  307  static int meson_pwm_=
get_state(struct pwm_chip *chip, struct pwm_device *pwm,
211ed630753d2f Neil Armstrong      2016-08-22  308  			       struct pwm_st=
ate *state)
211ed630753d2f Neil Armstrong      2016-08-22  309  {
211ed630753d2f Neil Armstrong      2016-08-22  310  	struct meson_pwm *meso=
n =3D to_meson_pwm(chip);
c375bcbaabdb92 Martin Blumenstingl 2019-06-12  311  	struct meson_pwm_chann=
el_data *channel_data;
c375bcbaabdb92 Martin Blumenstingl 2019-06-12 @312  	struct meson_pwm_chann=
el *channel;
2acdf419b01bae George Stark        2024-10-16  313  	unsigned int hi, lo;
329db102a26da0 Heiner Kallweit     2023-05-24  314  	u32 value;
211ed630753d2f Neil Armstrong      2016-08-22  315  =

c375bcbaabdb92 Martin Blumenstingl 2019-06-12  316  	channel =3D &meson->ch=
annels[pwm->hwpwm];
c375bcbaabdb92 Martin Blumenstingl 2019-06-12  317  	channel_data =3D &meso=
n_pwm_per_channel_data[pwm->hwpwm];
211ed630753d2f Neil Armstrong      2016-08-22  318  =

211ed630753d2f Neil Armstrong      2016-08-22  319  	value =3D readl(meson-=
>base + REG_MISC_AB);
329db102a26da0 Heiner Kallweit     2023-05-24  320  	state->enabled =3D val=
ue & channel_data->pwm_en_mask;
c375bcbaabdb92 Martin Blumenstingl 2019-06-12  321  =

c375bcbaabdb92 Martin Blumenstingl 2019-06-12  322  	value =3D readl(meson-=
>base + channel_data->reg_offset);
2acdf419b01bae George Stark        2024-10-16  323  	lo =3D FIELD_GET(PWM_L=
OW_MASK, value);
2acdf419b01bae George Stark        2024-10-16  324  	hi =3D FIELD_GET(PWM_H=
IGH_MASK, value);
c375bcbaabdb92 Martin Blumenstingl 2019-06-12  325  =

2acdf419b01bae George Stark        2024-10-16  326  	state->period =3D meso=
n_pwm_cnt_to_ns(chip, pwm, lo + hi);
2acdf419b01bae George Stark        2024-10-16  327  	state->duty_cycle =3D =
meson_pwm_cnt_to_ns(chip, pwm, hi);
6c452cff79f8bf Uwe Kleine-K=F6nig    2022-12-02  328  =

8caa81eb950cb2 Uwe Kleine-K=F6nig    2023-03-22  329  	state->polarity =3D =
PWM_POLARITY_NORMAL;
8caa81eb950cb2 Uwe Kleine-K=F6nig    2023-03-22  330  =

6c452cff79f8bf Uwe Kleine-K=F6nig    2022-12-02  331  	return 0;
211ed630753d2f Neil Armstrong      2016-08-22  332  }
211ed630753d2f Neil Armstrong      2016-08-22  333  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
