Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA4ECF857D
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2024 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6EX1iEs03cvKdZ0rmxn82GxEMJQbTgJScTawGORVVcE=; b=qkyIPeI6BczFGL
	nFLVDPZg6VbCmyuHKlRxCM+z1viwXr/dOsH5bC7VFvAjgp6yuOcBKP40T2Wy+dcYYeeWjKprgCG/W
	v9TzHuFS4VmvW7EvpRLSm3HQVRBgSiSIfbMllpFU+WCzfvc0l7aZK2iAJQ2R8zvN6M3CjBUw7O+Nx
	zo8cLjbVqNQ8MP/TVRacLfOcBbf21u5ZEAOpD4p6MQEIN/Tbw1N+n703zgSKQSFk27TpvXEnCam5M
	sFqxr7biQY/zMqtjOUSr7qvyqy4Wi7Ci77CGrsh6b+/ZmP/Dgo9av9lpZzavp11DO1Yit+k6YZ0MX
	rgGXS97cA45U82Sq/LFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swJsN-00000008tGr-3aKg;
	Thu, 03 Oct 2024 11:20:07 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swJrH-00000008stU-0s34;
	Thu, 03 Oct 2024 11:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727954339; x=1759490339;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s33xKLkAQRIbAlUPTP5cQcxaqv1POeyGIhVy9Hi8rOI=;
  b=Xp8uOe5dz6HST0D8A1l4YOjdYH1gT+N/2YGUDCdIIUQAenlhcikkrE3A
   I3lsG/NDXygDO24ocjcDBf4Kg6LHLWl98SbjhqJy+LmVgQHV7e5FhIR2B
   M5NNEZiVdZ+/ztSRiTrLpIXO/+7FQQqKZSFpDWAASSICTW+7nbXQeEYJx
   j+S1lrF/1i4sLWaJbwwO8OG/7suuCiqQh/c23EBhVraZbg4oo2/a+sxYk
   phMYhCMJhpMY83tEk8bh34yPN+XTTai9h0lsxZHwlmNH1tRVBsP08YcOt
   DuziS4PxXxJYaJlvjrMekIzRfY/xlC6TwrkFodT/WgwZ+5uulbKbkUaO5
   Q==;
X-CSE-ConnectionGUID: Tu5FkiVNQT2JHsqZznzvGw==
X-CSE-MsgGUID: 6Lm3aJaiR5eyhhpWEDnnSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012951"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27012951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:18:56 -0700
X-CSE-ConnectionGUID: 8n45Wya1R0GbuLQ0RLNqqA==
X-CSE-MsgGUID: SBXF83x3Qry5MaAdfgh5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74423646"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:18:52 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2024 14:18:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Alison Wang <alison.wang@nxp.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Stefan Agner <stefan@agner.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/10] drm: Increase COMPILE_TEST=y coverage
Date: Thu,  3 Oct 2024 14:18:41 +0300
Message-ID: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_041859_318793_317BC675 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cG9zdCBvZiB0aGUgc3RyYWdnbGVycyBmcm9tCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTMyMTY0LwoKQ2M6IEFsaXNvbiBXYW5nIDxhbGlzb24ud2FuZ0BueHAuY29t
PgpDYzogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+CkNjOiBMYXVyZW50
aXUgUGFsY3UgPGxhdXJlbnRpdS5wYWxjdUBvc3MubnhwLmNvbT4KQ2M6IGxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CkNjOiBOZWlsIEFybXN0
cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFi
ZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51
az4KQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgpDYzogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+CgpWaWxsZSBTeXJqw6Rsw6QgKDEwKToK
ICBkcm0vdGlsY2RjOiBBbGxvdyBidWlsZCB3aXRob3V0IF9faW93bWIoKQogIGRybS90aWxjZGM6
IEFsbG93IGJ1aWxkIHdpdGggQ09NUElMRV9URVNUPXkKICBkcm0vYXJtYWRhOiBGaXggcHJpbnRr
IGFyZ3VtZW50cwogIGRybS9hcm1hZGE6IEZpeCBhcm1hZGFfZGVidWdmc19jcnRjX3JlZ193cml0
ZSgpIHJldHVybiB0eXBlCiAgZHJtL2FybWFkYTogQWxsb3cgYnVpbGQgd2l0aCBDT01QSUxFX1RF
U1Q9eQogIGRybS9pbXgvZGNzczogRml4IDY0Yml0IGRpdmlzaW9ucwogIGRybS9pbXgvZGNzczog
QWxsb3cgYnVpbGQgd2l0aCBDT01QSUxFX1RFU1Q9eQogIGRybS9mc2wtZGN1OiBBbGxvdyBidWls
ZCB3aXRoIENPTVBJTEVfVEVTVD15CiAgZHJtL21lZGlhdGVrOiBBbGxvdyBidWlsZCB3aXRoIENP
TVBJTEVfVEVTVD15CiAgZHJtL21lc29uOiBBbGxvdyBidWlsZCB3aXRoIENPTVBJTEVfVEVTVD15
CgogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9LY29uZmlnICAgICAgICAgIHwgMiArLQogZHJpdmVy
cy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZGVidWdmcy5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJt
L2FybWFkYS9hcm1hZGFfZ2VtLmMgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2ZzbC1kY3Uv
S2NvbmZpZyAgICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2lteC9kY3NzL0tjb25maWcg
ICAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2lteC9kY3NzL2Rjc3Mtc2NhbGVyLmMgIHwg
NCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgfCA0ICsrLS0K
IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9LY29uZmlnICAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS90aWxjZGMvS2NvbmZpZyAgICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90
aWxjZGMvdGlsY2RjX3JlZ3MuaCAgICB8IDMgKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
