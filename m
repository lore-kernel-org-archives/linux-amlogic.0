Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30188C001DE
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Aug 2023 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0dvk3AtrbQzxbqFZrDcConYpjk1eIhZHfKtQzXadGLk=; b=MYcEkFm+HMXU4T
	ctg53UD7VoLlzP6/MJlUHRgErutDrdsjGIuFfQg2IfVFOPf92DfX3mhdShJJuJkYStHCBTsfujVU3
	ONEaXw8+CTxyW7C5O4rCV5aWJQGsyxqQCw5Se1NSz6KQIkXWwdg8EZppJe4bYpW7MQf15d/mUp+nY
	/FP5UwPy+dMl90f8AHuCgxyvggOl2wsBupYL/u96Iz2Olack7JsjxKNyBBBtQ+eOqSx5tbiAcKaju
	7Ut6TBS0bh5bd6UlE5YIE6FzhM+TFaL/SdYgGs4zFHzet3EQ6Z6BPEp/6+zMzFqsvCVefIq8o+dl4
	ZHBV/YEXOxGyC58zD6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTqoI-005u2S-1R;
	Wed, 09 Aug 2023 21:33:42 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTqoE-005u0j-1B
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Aug 2023 21:33:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe8c3b5ca0so233456e87.1
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Aug 2023 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691616814; x=1692221614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHhxE/dJDA6clbO9u01O1/s/eHxwxfI5ttey2qrEI7Y=;
        b=lOEq3UiLppEvzFQ+XytrfD/OLqlj+o2lGGJ2iLdVlf9NZ4HjVkiVf87RBQMqy//Xdj
         VOtjEkVw6I5hTl8fjCTdzz4Zr2W9AlHkxzp0OyYs5pukC1ePGvWhlT3An1SQhg63uie4
         p23kTFFbUEzmr5al2aWfVctMdFlN9iqmJmyz8Ej2RJWxnjVhK8p9+fZiFOszWmKwFMXQ
         zuaDyExqGHbzAD87dN9VYVazNOfM53tOex/XTc9VJJ6FpWSmzsR+y2l+cOq0helpBptI
         FtIpytHR9FuhE1fCxdEXJ4i0lyJjhrTrnYs3qjOBTisR++lA3QbB9VOhT6/6S0A2j+XN
         IjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616814; x=1692221614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHhxE/dJDA6clbO9u01O1/s/eHxwxfI5ttey2qrEI7Y=;
        b=koRDVrckd2xRN8KLtyAo2jAzv49TzJbjuv6heqi+InH+6WZlDT+wCgOZVf+FJlChOw
         0MvWYW3Ym2U7JF/VLMdI8BTj8tTgIgTTpbcBm+oQAoJSlwQhh5pNnOVtPZgrp/AZfS1o
         ll9mazZYxmJdScxa9o+aGXvlyLYRLQQZbKwXC3X080OUumKRzuQy1g/hlWzry9Eit0e0
         1MC7CfPtc4UL6e4rIhuSTox9Sb2WQg6TuYmvFNLB/K/fTsxlTLjWZeNr7INR+s8O8cdn
         ojiMkCoi1JUqhPiRW3VqwAgALFCHdrDbJxNqweeZqeJYUfYlDoIaEdnIdQr2LQKWn+ou
         CJdw==
X-Gm-Message-State: AOJu0YxOgPnDAOZuEc55/83plO5zVI1aOZfgjS0qAhINlgafUG3FlI5d
	xHTSo/AhpuuzDdHplaiptuqiRQ==
X-Google-Smtp-Source: AGHT+IFF1nfi6ptRW3iihGsy7dhGfDFYH+hxDzqxsKBwEmZmm7zQoFcXeraSGoiglsNibHtSGD+FVw==
X-Received: by 2002:a05:6512:3baa:b0:4fb:8f81:4fe8 with SMTP id g42-20020a0565123baa00b004fb8f814fe8mr258735lfv.46.1691616813958;
        Wed, 09 Aug 2023 14:33:33 -0700 (PDT)
Received: from bear.local ([69.165.74.129])
        by smtp.gmail.com with ESMTPSA id q2-20020ac25282000000b004f864690901sm2450645lfm.244.2023.08.09.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 14:33:33 -0700 (PDT)
From: Luke Lu <luke.lu@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Da Xue <da@libre.computer>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Luke Lu <luke.lu@libre.computer>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
Date: Wed,  9 Aug 2023 21:29:11 +0000
Message-Id: <20230809212911.18903-1-luke.lu@libre.computer>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_143339_420410_03B0A202 
X-CRM114-Status: GOOD (  11.64  )
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

Device connected to usb otg port of GXL-based boards can not be
recognised after resumption, doesn't recover even if disconnect and
reconnect the device. dmesg shows it disconnects during resumption.

[   41.492911] usb 1-2: USB disconnect, device number 3
[   41.499346] usb 1-2: unregistering device
[   41.511939] usb 1-2: unregistering interface 1-2:1.0

Calling usb_post_init() will fix this issue, and it's tested and
verified on libretech's aml-s905x-cc board.

Cc: stable@vger.kernel.org # v5.8+
Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
Signed-off-by: Luke Lu <luke.lu@libre.computer>

---
Note here, the commmit of Fixes tag is the first patch which bring
suspend/resume function, so let's use it as the fix tag.

As commit 5b0ba0caaf3a: (usb: dwc3: meson-g12a: refactor usb init)"
introduced the use_post_init() function, and this patch will explicitly
depend on it, so let's set kernel version higher or equal to v5.8.

Changes since v1:
 - add Fixes tag and Cc stable tree
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index e99c7489dba0..2c07c038b584 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -926,6 +926,12 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 			return ret;
 	}
 
+	if (priv->drvdata->usb_post_init) {
+		ret = priv->drvdata->usb_post_init(priv);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
