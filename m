Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FD8C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzPsMfoB6qfqwbQZ/nbV5Wncrmcp/RarWwXUdHn2YOg=; b=bBby99xH1r6+zW
	PaK50nboE2tePUPduhFVrxKG5By8L373yxgQRTMrkwLvRQmFCQRiqh1kYEPz1YeCa4klnOF9a3WDZ
	cHil10YtIvOW2y//DzwczmIL1FohxaD+4YsuGsRdl5Y7t+beIiP8pRe+W9NVGYlHFREhoZ+RhlYFI
	ISpwfvXQctLSJ5l8xWn/Q9ZuJtgJfJ5B+yY9xltfXnwtcUZGm5p848RxWCITsW13YAJUseu5wbeEu
	/7Ymcgx4g3NG2yoD8FaW/JoomubDxNpHCuDypbd1NuoNgviHZM47ScwsRKY1ysOcHBWUPIy3+E/42
	5INNBfrAWLzcRSi64Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol59a-00HGc7-7L; Wed, 19 Oct 2022 09:14:22 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol58p-00HG3w-JM; Wed, 19 Oct 2022 09:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666170815; x=1697706815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I2sO96QvGbKZASEZajyqgl5elACacZqC44Dvl0bF594=;
  b=KHQdRngMfSJeTjHil7/a9Mu1x7WLczSHuf4EzSxyktVTVJtQL+hN8mfu
   9HdPPd7vjpBaRPgztHpPmgWJJnGJ9EPOys7f7+E9yVPp8Mel5N3gn2z14
   l7+dKFivB0ByfFFmAu2pM/wp7Vw9t2tCnThxrUMtS7eIpH1f5sSQrQZIR
   jjTJaI1qIvtncItwBZRtMljT8burj9dEI2dQpU3inal8Qnd9M6qxmLhay
   RCYWpJ0iwJyJN1UgUxN88A9+47wlMGo/XuiIUDKoBRYbgcze0YNX7v1vD
   3kBl1P7QgCrlYXV6CSapAd94iAsAt+5eKlDyP1z1ugHmB8YU/9aratZqs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="286746427"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="286746427"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 02:13:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="734118880"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="734118880"
Received: from sponnura-mobl1.amr.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.214.35])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 02:13:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 22/44] serial: meson: Use uart_xmit_advance()
Date: Wed, 19 Oct 2022 12:11:29 +0300
Message-Id: <20221019091151.6692-23-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com>
References: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_021335_665368_844E7C06 
X-CRM114-Status: GOOD (  10.00  )
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

VGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIG5ldyB1YXJ0X3htaXRfYWR2YW5jZSgpIGhlbHBlci4KClNp
Z25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgMyArLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3Vh
cnQuYwppbmRleCAwNTYyNDNjMTI4MzYuLjc0MTEwMDE3OTg4YSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy90dHkvc2VyaWFsL21lc29uX3VhcnQuYworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25f
dWFydC5jCkBAIC0xNjIsOCArMTYyLDcgQEAgc3RhdGljIHZvaWQgbWVzb25fdWFydF9zdGFydF90
eChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQogCiAJCWNoID0geG1pdC0+YnVmW3htaXQtPnRhaWxd
OwogCQl3cml0ZWwoY2gsIHBvcnQtPm1lbWJhc2UgKyBBTUxfVUFSVF9XRklGTyk7Ci0JCXhtaXQt
PnRhaWwgPSAoeG1pdC0+dGFpbCArIDEpICYgKFVBUlRfWE1JVF9TSVpFIC0gMSk7Ci0JCXBvcnQt
Pmljb3VudC50eCsrOworCQl1YXJ0X3htaXRfYWR2YW5jZShwb3J0LCAxKTsKIAl9CiAKIAlpZiAo
IXVhcnRfY2lyY19lbXB0eSh4bWl0KSkgewotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
