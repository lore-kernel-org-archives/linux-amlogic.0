Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC71DC71133
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Aug 2023 13:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBZrGJa+PvXRRjbcBU2L3NXJR1WOrhOi7p79qNg2DEg=; b=zzv6cVacTQntAA
	sdMr3gWeBH1AaeSGW9y0FrysG+OlmeJ9n6ppQo7qeVtWtvFDE9vagQ2CpMV8BtskDzBB9qJHm0xSN
	2AGn1+FhFmqIHd4lCESCSUPSFWF2cjgX61sCluOq6ijoaVEN0SDRLN61ti12CJpnlHczB7gdh6Or7
	RwhFCwz44YWCfPco6c2SbdUhWowRvLnxHUEF9W1WC+g7yodv7pGwJMDoGLw2Bxupol4JhIuJToe0x
	7jhidP/gcBcOJXBb3AJOJMOQQrSMceMr4HjpGVy8b9j7+c42bbGAJv/AEgkg5MdnUMH+3xnUpSk+s
	bX8G48RuZ5jtATggoS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXIb-005VLT-1Z;
	Fri, 25 Aug 2023 13:56:29 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXIY-005VJB-0d;
	Fri, 25 Aug 2023 13:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692971786; x=1724507786;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=rL8lwlEpWwyz5gytyannueKCuDWZ7o3Z7O2OXGq9D24=;
  b=Q2qfLDhFNOwCVqRTTDjZjmBDgdHT2gPHYHaPn//cqEAw7uE+FfDk+e4f
   zFHbZ99dPN4rGMrb4/mNyY9/smLrto8aaxr7ZwRAhm0YOrnCByt6re5G/
   9y7gtyfziHkCsahgSh+XGmoLOm68TqKgDnqt75rdWeVT6kOSI66EGeVmR
   Ammoy7+dikd9vgHhVRIi62ovBXQBe8HwgyuGJzR6yaISmP0ACSJ2ZlbGt
   w97XBLktIigLIsVUcow+NFc+eCYFVn7Yg88YrYRZANDtgybaSZCEWlAaw
   drPVeKrpJszDGhJ4mX6sLLvP7MJcN6tLioCiZWlKDSdmMdNF7DcKqWVcX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373586062"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373586062"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731073145"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="731073145"
Received: from ogbrugge-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.56.56])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:56:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 david.heidelberg@collabora.com, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH 2/6] drm: ci: Force db410c to host mode
In-Reply-To: <20230825122435.316272-3-vignesh.raman@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-3-vignesh.raman@collabora.com>
Date: Fri, 25 Aug 2023 16:56:12 +0300
Message-ID: <87pm3b2pkz.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_065626_246596_D2498D7D 
X-CRM114-Status: GOOD (  18.29  )
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

On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Force db410c to host mode to fix network issue which results in failure
> to mount root fs via NFS.
> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
>
> Since this fix is not sent upstream, add it to build.sh script
> before building the kernel and dts. Better approach would be
> to use devicetree overlays.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/build.sh | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..c39834bd6bd7 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
>      fi
>  fi
>  
> +# Force db410c to host mode to fix network issue which results in failure to mount root fs via NFS.
> +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
> +sed -i '/&usb {/,/status = "okay";/s/status = "okay";/&\n\tdr_mode = "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> +

It seems like a really bad idea to me to have the CI build modify the
source tree before building.

The kernel being built will have a dirty git repo, and the localversion
will have -dirty in it.

I think it would be better to do out-of-tree builds and assume the
source is read-only.

>  for opt in $ENABLE_KCONFIGS; do
>    echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
>  done

Ditto for the config changes in the context here. Those are files in
git, don't change them.

Shouldn't this use something like 'scripts/config --enable' or
'scripts/config --disable' on the .config file to be used for building
instead?


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
