Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8BFCF857C
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2024 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fjc1EkT4FIc6McIA4aAI1+jdXMkj8ES771lSTUhqRP4=; b=td+tyHMes229wq
	acXR7CdV7p8EFQ7yUkPrpDVWRg3dY3rhrACw9GVc2jdJlUomXnr32xwNoLxMGas1wsI6dRyuWpIwo
	bPFq3noKNmid7aWFX+hajPSHa3ECT8gqA9taqI05Hko2zjEEsPsdt2Ehwit52GWXaLxgWxTJVYIe/
	/OkZMxGUK9JX2icipbfQgn2qpwq0/KrGmjj0CSCGlTXAaCaJ2rkUf8d11EekeBNjYvtGDu+EdwJFS
	QT2HLctj+DHrUZWl1raLlQn2AKzQpqcKaAvoVChIdnl6Vf2KyPWNGpQQKKxB7vOkJvK/hpeQDtRm6
	5YCIX4qns5lpuVSVb+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swJsP-00000008tHg-0yC9;
	Thu, 03 Oct 2024 11:20:09 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swJrj-00000008t6T-2Sm3
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Oct 2024 11:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727954367; x=1759490367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1WWBSxzILxSYsGawLcrm3HdTa6GEE9/bUz51NQZ0heg=;
  b=ZtYBDfoDgwjVov8YKTQxE4IbVs9/ga2zDwXVeMSbgtZoz1ofDUK77bNo
   8o2V2olP3c2p1AM1U1NzhPLNHca1Ib9xXycCfSu83P32jL8Jr8St7BgB9
   tc4OY4aUwrpQEy9S7f/IZaVp12jbC+KBz1cnItQLP440jfLX4jXXehjpG
   KSeeqb8gu03fa6D2aS0uYWh+kSRxq5zlrQip1B1l3P6C6Eqtb8ANIREMD
   ZqN9E9CQvSguEV9L3p97DEVd7hJuxFYJbl8/Rvj1g77qC/wqs6dkDpGoc
   geOFUVqf8Fgg4vIBZMN3PAb1LkLQaXXN9LjtrBs/9O8ljKCQVcvcd1sij
   g==;
X-CSE-ConnectionGUID: J9lQUbKkR3+7kaqoTZKE0w==
X-CSE-MsgGUID: Cv367aoDSK2SCGN+1PNnPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27013030"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27013030"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:19:27 -0700
X-CSE-ConnectionGUID: sqs5aFW3S6yEfoNZtQFAWA==
X-CSE-MsgGUID: CqCmrdf6RCmqVgsfFpIjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74423838"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:25 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2024 14:19:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 10/10] drm/meson: Allow build with COMPILE_TEST=y
Date: Thu,  3 Oct 2024 14:18:51 +0300
Message-ID: <20241003111851.10453-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_041927_795749_4AAA890A 
X-CRM114-Status: GOOD (  10.51  )
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFs
bG93IG1lc29uIHRvIGJlIGJ1aWx0IHdpdGggQ09NUElMRV9URVNUPXkgZm9yIGdyZWF0ZXIKY292
ZXJhZ2UuIEJ1aWxkcyBmaW5lIG9uIHg4Ni94ODZfNjQgYXQgbGVhc3QuCgpDYzogTmVpbCBBcm1z
dHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CkNjOiBsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vS2NvbmZpZyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJt
L21lc29uL0tjb25maWcKaW5kZXggYjQxMGUwZDgwMTVhLi40MTdmNzk4MjljZjggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9LY29uZmlnCkBAIC0xLDcgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiBjb25maWcgRFJNX01FU09OCiAJdHJpc3RhdGUgIkRSTSBTdXBwb3J0IGZv
ciBBbWxvZ2ljIE1lc29uIERpc3BsYXkgQ29udHJvbGxlciIKLQlkZXBlbmRzIG9uIERSTSAmJiBP
RiAmJiAoQVJNIHx8IEFSTTY0KQorCWRlcGVuZHMgb24gRFJNICYmIE9GICYmIChBUk0gfHwgQVJN
NjQgfHwgQ09NUElMRV9URVNUKQogCWRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01QSUxFX1RF
U1QKIAlzZWxlY3QgRFJNX0NMSUVOVF9TRUxFQ1RJT04KIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIK
LS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
