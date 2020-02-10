Return-Path: <SRS0=6ZbY=36=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87908C352A4
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2020 23:00:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 514612051A
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2020 23:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5Z51CzC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0yWasi5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 514612051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FsO5XMKB632EgGzZPSCWc6Trq+3OHNvBzgdLOGeEI1Y=; b=a5Z51CzCNS9HG8
	kgK3eURkAHFM6+ikeucmeh3v0dwEUpXWSllD5E032v51/8laJN0e9LBIh3tiV4hHgnfUzd2xItCnO
	72Ze0+VP8nFk4+n3kTNnaRT0EU2WWjLxOORZaPrhgWTbzuSLJAzR22T19s5jpeVlbmH+A16gtbl/h
	B2Bkch44VBId1fSRIA2E22MwRUQaTq/Ze31Qki+LMHcDr/PrCac9nd6zfxkszWK9jYrNxwgMQzSGI
	3Y58TfyP0i0JXWSV91+CxKYikw/IB9hCb/nzEIXmHMCen/NiibybxC5fu7PFif+ok8YpAoEgBXvfE
	0ZTQbEJjIjzEk6vq3irw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1I2I-0001cl-Ph; Mon, 10 Feb 2020 23:00:14 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1I26-0000D0-0B; Mon, 10 Feb 2020 23:00:03 +0000
Received: by mail-oi1-x242.google.com with SMTP id a142so10942826oii.7;
 Mon, 10 Feb 2020 14:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2g0oTCV98K2k6Xzoh29zE55ImVHkBdtE4+mSxUulQQ=;
 b=P0yWasi5AD3Wkz/vo7yXo6yPuziD6iH6KVE8Q4bimB6WtQzDEGVCzAezGZWb5k1W/w
 Z3VnF48KO1MFvUq/PYlKG96U0XCWBkZi4BEoZOfhJRetQloceUj4EboyQMfGIfdiWwMQ
 5frXSdglP2M9xnE8DbEyl5GOqlKRymcz8n0OOw5y/drqhSgXwypJcoE7C6KVLYBhhUma
 YhK//vHGZi4wWwJJO5iplJ8thpu4ffDHGFEt4IaJY+HDlOiSMPxLpW1vGmhH/t5mGWmP
 7Z9PGLdLzUOHoG+WVQ6mZVShDxTkw+cAbUsA7kYE2YV/Yni7Hfb3flIETXftd93ndXRq
 JGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2g0oTCV98K2k6Xzoh29zE55ImVHkBdtE4+mSxUulQQ=;
 b=eMSQEBy3BnDNJxSNwUOe/4EDtx68cySkShYtiIHT1NNQS9JxSsXQe7lC8bW/rBFDsC
 XwauvEf6txdZjMWsHx5X5eiEjlhotlVpDPVOc4iclaZSshfv2wOmR5ROB1pLLGajEL8q
 sraoped7HRgC1GTQv+LE167FfCtoFd/F/XKU7+1sA+OclsDZan5jw7OCHqZ1vcBNQh5k
 VoK9oFkgnwxWO1uKPBNWJyJQjOsn6oiaf/aaUDJrqHEt5m7Epnuorj2RKQ/mkJPPG1Ra
 yJ+FMqfCMSMSHx680EUQa0c+1ZEaqE3eZsL5xZbdbyMbcxwo+uNbodfHENIS2hXKzS4y
 1sNA==
X-Gm-Message-State: APjAAAV8adSJ7U98Y22ZtSneBnGUbq6CGWq2eFESOe1h+lExZeXamBSX
 ihs2TkuncSKn2ES2Hp7RF8s=
X-Google-Smtp-Source: APXvYqwDbrcIeb7Xbibh7qCosUJ25r6zAICrriHVO5CceM7+UyW/5dwZqBATLkJk71AmXk2eQKqTWQ==
X-Received: by 2002:aca:458:: with SMTP id 85mr1030996oie.56.1581375598184;
 Mon, 10 Feb 2020 14:59:58 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id r17sm546985otq.70.2020.02.10.14.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 14:59:57 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: dwc3: meson-g12a: Don't use ret uninitialized in
 dwc3_meson_g12a_otg_init
Date: Mon, 10 Feb 2020 15:58:17 -0700
Message-Id: <20200210225816.36598-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_150002_052241_05AA5F53 
X-CRM114-Status: GOOD (  11.35  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Hanjie Lin <hanjie.lin@amlogic.com>, kbuild test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yue Wang <yue.wang@amlogic.com>,
 clang-built-linux@googlegroups.com, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Clang warns:

../drivers/usb/dwc3/dwc3-meson-g12a.c:421:6: warning: variable 'ret' is
used uninitialized whenever 'if' condition is false
[-Wsometimes-uninitialized]
        if (priv->otg_mode == USB_DR_MODE_OTG) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/usb/dwc3/dwc3-meson-g12a.c:455:9: note: uninitialized use
occurs here
        return ret;
               ^~~
../drivers/usb/dwc3/dwc3-meson-g12a.c:421:2: note: remove the 'if' if
its condition is always true
        if (priv->otg_mode == USB_DR_MODE_OTG) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/usb/dwc3/dwc3-meson-g12a.c:415:9: note: initialize the
variable 'ret' to silence this warning
        int ret, irq;
               ^
                = 0
1 warning generated.

It is not wrong, ret is only used when that if statement is true. Just
directly return 0 at the end to avoid this.

Fixes: 729149c53f04 ("usb: dwc3: Add Amlogic A1 DWC3 glue")
Reported-by: kbuild test robot <lkp@intel.com>
Link: https://groups.google.com/d/msg/clang-built-linux/w5iBENco_m4/PPuXreAxBQAJ
Link: https://github.com/ClangBuiltLinux/linux/issues/869
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Note: This patch is against Felipe's testing/next branch.

 drivers/usb/dwc3/dwc3-meson-g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 70d24b98fcad..902553f39889 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -452,7 +452,7 @@ static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
 	if (IS_ERR(priv->role_switch))
 		dev_warn(dev, "Unable to register Role Switch\n");
 
-	return ret;
+	return 0;
 }
 
 static int dwc3_meson_g12a_probe(struct platform_device *pdev)
-- 
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
