Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0ABCD1292
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/CpC9xnTqVy5UU3H4yJr/18Fq7GwpBaTmoP0b67dMA=; b=apZuOOpmCCF/Pd
	5uvWf/P4SgybM8rkCJvoteHQSvqDds1oMmz+u4h9LoUKScZUKnGmrcwJ0tdsY2VW7x3rSIvauYQ8s
	ZEcjpVu45jT5iMTTq8YzAmIDhDqr1VZDWvIhGOQZDFJ/Rm6pHT5PJ82+QzlkptzkkFAeFpexbI/Hw
	b5tBepsmnd3/wXusiuwGxB62Xd5LZzqDZD3e+hW3yGQiL8i2rg2dE7np+D7mrX5OE2iaEY60m5EEV
	XwGx3e2MeMcwCc3BJmEgk/PFaNgN/RTK8HhUQW0h+kR8mSLvMTuaiILSCdoDWxVb+2jQjkbGWOOKX
	Q9lO8ak4c0y8HW8t8iRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsR7-0000000GI5Q-335x;
	Mon, 08 Apr 2024 17:05:37 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsR4-0000000GI1Z-0PxE
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Apr 2024 17:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712595934; x=1744131934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ep6l4tE6d/T5WqNMeZ7oCFUOTHiY9hJKRKAOBw+/Si0=;
  b=DhLzgOh8D6lPCpblfYM9DBRZNxrH+eLyww20zInnUL3uBrx9P0tG2STq
   PeCXBPrvC1dIgRhu+cODCv26LfOgpbBWHOSby+GAdrOxYMyy0SeoNSSXi
   qQigeyIVnhe07iUL7DBQuWRCywYPmBN5N7j7fx08jH+c7uReGiQZ2Vmco
   kvQnAyaqcrT4DCkPG5W8J1NLh0dRkLrbg4R9UlhUQfLzpLHMQ0ZPKLnxk
   n8TBTIbWX82YEiStniYQhk5mO485vL5Tm8IA8e6L8PR8fZYBCgJA5xUz8
   9EoAQeo4czyCO36hk974Aus9qQiqNyios5Ay64JmLFp0AkFTSWFsDBE+b
   g==;
X-CSE-ConnectionGUID: IzUMeFGHSSO9QeadkXMe/w==
X-CSE-MsgGUID: TDPmRMLjROyYfFop7ebjPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793487"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793487"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 10:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792343"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="827792343"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:31 -0700
Received: by stinkbox (sSMTP sendmail emulation); Mon, 08 Apr 2024 20:05:30 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 19/21] drm/meson: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:24 +0300
Message-ID: <20240408170426.9285-20-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_100534_198388_36FE26CF 
X-CRM114-Status: GOOD (  11.46  )
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
L21lc29uL0tjb25maWcKaW5kZXggNTUyMGI5ZTNmMDEwLi5kOGY2N2JkOWM3NTUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9LY29uZmlnCkBAIC0xLDcgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiBjb25maWcgRFJNX01FU09OCiAJdHJpc3RhdGUgIkRSTSBTdXBwb3J0IGZv
ciBBbWxvZ2ljIE1lc29uIERpc3BsYXkgQ29udHJvbGxlciIKLQlkZXBlbmRzIG9uIERSTSAmJiBP
RiAmJiAoQVJNIHx8IEFSTTY0KQorCWRlcGVuZHMgb24gRFJNICYmIE9GICYmIChBUk0gfHwgQVJN
NjQgfHwgQ09NUElMRV9URVNUKQogCWRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01QSUxFX1RF
U1QKIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKIAlzZWxlY3QgRFJNX0dFTV9ETUFfSEVMUEVSCi0t
IAoyLjQzLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
