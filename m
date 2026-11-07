Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605A5606A335
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tscCwOMx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aD//XDDW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KPNxkozu8s95LMAcEYAytJFKvrDuyeQtn+r9vZ8Fr3k=; b=tscCwOMxGvAgYaK+xAnDQGbcfx
	hGDGClNf0NpFP5mhl6Rd7ZPof9rCInZjO7SgoREKm46Wy0gT022ic0l28DdRLc2BMOgpFqLhM9dZz
	dOmz8gx/mpKbRdr+RxZ2q8efeamraAqhpfpnVnpwhamij7XhykLSm7Qz7NANiLFGFpwXhqI9OCZIw
	8qLAhLg7Wo7N5yW5fmyib0U3Cq1vE03024wHxN70HWVqRJywiy1OS/jjHFI9iKir/O+LwhuFmMbOy
	8K7VlvOttjJXun/cQ5oLvImkNFBkv2yYGYhPMlTa42SXU5SOmTXMdmOHFSExUxc2ql2tm6gT669rm
	qe7zOjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmo8-0000000FJwd-1fme;
	Sat, 07 Nov 2026 20:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmno-0000000FJJV-0lf3
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=; b=aD//XDDW5UmyqErztyWJ5s7mMJ
	vNXZva+vpD1PMEZIO2cZqWdGUuRrXiNtDM4RNBjF8m/RONe21d1r+6I/8HJh1oxK9y4gxDrbOgGFy
	dCkLq8IVOe+Ef4N+ePDHOgdCVD29R7ZpOW3zeQBTsMRil46aXmRU9kc9b3V2sOLRazmKMWLVDSxK4
	XMSZ3vQmP3pLObFJkvD2yOn4b3+Kyoi4XplQwZ1/e6XftEIU/1Q29mOycF5VezBfzgEU3QTBv9U7h
	miHd8QBeHIZdoj6QqLkyGoib8EdVq4wMbYiz2E5nCEPzw7IBZGxTAz8J91zOanPiR7WvLtT4Qrsu3
	Juy1vgOQ==;
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnf-00000005Qx4-0gl9
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 20:14:12 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6dd7070699eso1179542eaf.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 12:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082445; x=1794687245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=DRThssvB0eDLaCZUrToF60Mlc8rZztdvPHKMbaqjuGMkwDRWS9+NrP0klMBS2jlIGh
         aMTcFjuS9d91b3avRsfRryeB1YGWoAAk/NeU/VUcXOhjYfmCkk1XHWGJu00KFs/250HQ
         YEC5EoT/ct/dPIgyfznfskZzsLiBULeHxiNkB0sqcET1kqtC7lLThEsZI9jUe5Tf/Ic0
         kVrSiKf8I6uJMJKeMcQHdlh1hlH0Cxs0Kbr0G2sZFTpojOfclWcExcb7KxHdOhGM7X1i
         Bvawlfh/AjEmDb47RY2d8626cImSZSgg0azb7aXesnNIZGvUpvRbTCkvtq4t/u46Ie+m
         tvIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdz7708WtvQRi0/xkcxVzMASWz+fwkEwYrYa06Bm3fXs7iRZUwX1m3+UuVOTLFwJlwvjOpEAOwv0ZTxPn1@lists.infradead.org
X-Gm-Message-State: APuU4Z/yA8yUA5ULnuaHuRE69Q7dhgw2HppfkbBvMxEzLSddLiEJ2+ot
	XV4z5+zzWvBp5jNy+AO5Oexh0y8oBB1RAjbl8WpvTlTESb4QSzHSbGHdc4mOEYNPJsA=
X-Gm-Gg: AYBFou0eQeb5Q3lipVRRxDH1M1fE9KUzFCp8BKtdH8CrIgh/vpBKa5jLOIe73dSRA04
	OXGYPfL+G33/kK/xm4FbGsrJIWwtPqzEL2qcpO02F6N/izI6QngwCKiPzg53/cVj+7oj26ra8Ug
	Fj37TJvkPpvmpgM586WTUXwrIf1cpNxRjZLtaTkCRNmS0osw9S5yMnF5yW6MrLzRhvFf05eDish
	H4adRCwD92iWG8Hu5R9svnxskNkSaZZ4m89WirKxDivCSYGizJRgmLTOyJ4vVgVxAe3zjQFWiTE
	qlgWHQhu4cinhZnWcUr2f9sBhDEB9cBDWd3ptbcYiCTHQ+3OE4J3EmwKPZeolPOoEQo6RZsMend
	hWxZslQk23dH1THC6l+5NX0YY4Q5PpAMJJEsGK4L0IqxnUFJKdplCEY0iJwS5rhCviOfiQzDlSZ
	PCkK8H/QVUD6bhsN4GgNuAy6l/6+Y+Sj4uGJgcKJC11WnCsLvf0GqExQYVYmsEYUuKdIoJR/BXV
	KXWpN55saVQJ4iEpM3Lz4mxEzC423BpPZMru01jr9tWjaYjE6oGd4JKiuQCWwkymKTfVoAvOvTl
	HaAhjURh9DBVv9DhF8ATcOs7+B7o7gvBXuwXOCHkufH3t9EQs5FSll88fI9xICOtJBOVse2IF5c
	sj23PNg==
X-Received: by 2002:a05:6820:820:b0:716:c0d5:2cfb with SMTP id 006d021491bc7-7170f1be2c9mr28227eaf.6.1794082445409;
        Sat, 07 Nov 2026 12:14:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:49 -0700
Subject: [PATCH 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-52-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_201407_218341_AA22E386 
X-CRM114-Status: GOOD (  16.02  )
X-Spam-Score: 3.5 (+++)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RGlzY29ubmVjdCB0aGUgc2Nhbm5lZCBjaGlwIG9uIHJlbW92YWwgYmVmb3JlIHRoZSBCQ01BLWJh
Y2tlZCBoYXJkd2FyZQpzdGF0ZSBiZWNvbWVzIHVuYXZhaWxhYmxlLiBSZXRhaW4gdGhlIGVtYmVk
ZGVkIE5BTkQgY29udHJvbGxlciBhbmQgY2hpcAp1bnRpbCB0aGUgZmluYWwgTVREIHB1dCwgaW5j
bHVkaW5nIHJlZ2lzdHJhdGlvbiBmYWlsdXJlIGNsZWFudXAuCgpTaWduZWQtb2ZmLWJ5OiBKYW1l
cyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4uYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4uYyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2JjbTQ3eHhuZmxhc2gvbWFpbi5jCmluZGV4IDRkNGUxODVjMjJlNS4u
NjBmYzQ0MGQ0NTE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZs
YXNoL21haW4uYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL21haW4u
YwpAQCAtMTksNiArMTksMTIgQEAgTU9EVUxFX0FVVEhPUigiUmFmYcWCIE1pxYJlY2tpIik7CiAK
IHN0YXRpYyBjb25zdCBjaGFyICpwcm9iZXNbXSA9IHsgImJjbTQ3eHhwYXJ0IiwgTlVMTCB9Owog
CitzdGF0aWMgdm9pZCBiY200N3h4bmZsYXNoX3JlbGVhc2Uoc3RydWN0IG5hbmRfY29udHJvbGxl
ciAqY29udHJvbGxlcikKK3sKKwlrZnJlZShjb250YWluZXJfb2YoY29udHJvbGxlciwgc3RydWN0
IGJjbTQ3eHhuZmxhc2gsCisJCQkgICBuYW5kX2NoaXAubGVnYWN5LmR1bW15X2NvbnRyb2xsZXIp
KTsKK30KKwogc3RhdGljIGludCBiY200N3h4bmZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGJjbWFfbmZsYXNoICpuZmxhc2ggPSBkZXZfZ2V0X3Bs
YXRkYXRhKCZwZGV2LT5kZXYpOwpAQCAtMjYsOSArMzIsMTQgQEAgc3RhdGljIGludCBiY200N3h4
bmZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IG10ZF9p
bmZvICptdGQ7CiAJaW50IGVyciA9IDA7CiAKLQliNDduID0gZGV2bV9remFsbG9jKCZwZGV2LT5k
ZXYsIHNpemVvZigqYjQ3biksIEdGUF9LRVJORUwpOworCWI0N24gPSBremFsbG9jX29iaigqYjQ3
bik7CiAJaWYgKCFiNDduKQogCQlyZXR1cm4gLUVOT01FTTsKKwliNDduLT5uYW5kX2NoaXAuY29u
dHJvbGxlciA9ICZiNDduLT5uYW5kX2NoaXAubGVnYWN5LmR1bW15X2NvbnRyb2xsZXI7CisJZXJy
ID0gZGV2bV9uYW5kX2NvbnRyb2xsZXJfaW5pdCgmcGRldi0+ZGV2LCBiNDduLT5uYW5kX2NoaXAu
Y29udHJvbGxlciwKKwkJCQkJYmNtNDd4eG5mbGFzaF9yZWxlYXNlKTsKKwlpZiAoZXJyKQorCQly
ZXR1cm4gZXJyOwogCiAJbmFuZF9zZXRfY29udHJvbGxlcl9kYXRhKCZiNDduLT5uYW5kX2NoaXAs
IGI0N24pOwogCW10ZCA9IG5hbmRfdG9fbXRkKCZiNDduLT5uYW5kX2NoaXApOwpAQCAtNDgsOSAr
NTksMTYgQEAgc3RhdGljIGludCBiY200N3h4bmZsYXNoX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBiNDduKTsKIAorCWVy
ciA9IG5hbmRfc2V0X3JlbGVhc2UoJmI0N24tPm5hbmRfY2hpcCwgTlVMTCk7CisJaWYgKGVycikg
eworCQluYW5kX2NsZWFudXAoJmI0N24tPm5hbmRfY2hpcCk7CisJCXJldHVybiBlcnI7CisJfQog
CWVyciA9IG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIobXRkLCBwcm9iZXMsIE5VTEwsIE5VTEws
IDApOwogCWlmIChlcnIpIHsKIAkJcHJfZXJyKCJGYWlsZWQgdG8gcmVnaXN0ZXIgTVREIGRldmlj
ZTogJWRcbiIsIGVycik7CisJCW5hbmRfZGlzY29ubmVjdCgmYjQ3bi0+bmFuZF9jaGlwKTsKKwkJ
bXRkX3B1dF9tYXN0ZXIobXRkKTsKIAkJcmV0dXJuIGVycjsKIAl9CiAKQEAgLTY1LDcgKzgzLDgg
QEAgc3RhdGljIHZvaWQgYmNtNDd4eG5mbGFzaF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAogCXJldCA9IG10ZF9kZXZpY2VfdW5yZWdpc3RlcihuYW5kX3RvX210ZChjaGlw
KSk7CiAJV0FSTl9PTihyZXQpOwotCW5hbmRfY2xlYW51cChjaGlwKTsKKwluYW5kX2Rpc2Nvbm5l
Y3QoY2hpcCk7CisJbXRkX3B1dF9tYXN0ZXIobmFuZF90b19tdGQoY2hpcCkpOwogfQogCiBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBiY200N3h4bmZsYXNoX2RyaXZlciA9IHsKCi0tIAoy
LjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
