Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FE2C54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 08:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fj9OJYZ1YEJQ+OqQVxw5ZhGSk3g7ZFKHJjID9U85IfA=; b=sRIebuFRc8RtdW
	cu5AM06xTcP0CxBE9rIKTxw8EaJIr43y/faW0sIRA1YgDYfsnx01M9NDf88rr9t70DB02h+KpB/W5
	UpZkEv7wcTCTrFgcq4O32dqkRQzRSKrRX9tvMekuMd3fEZ1c7+/WbSRAOu1WhPlOkLh62TQYaCs/2
	/c0F6jPMVwF97vPnMuQOhvNKVM7+8kU5Do1xBD/SoEnVNlrtsAjvo9JCCxEoTeoUJ8yJU2Rt3YPko
	DvOhZyokt9uRKEFS2m4qrmznrzfbObDYpC0wUSiYYN/p7j8kyUfnLXgbt6WyFg85E3yukWDhR2D+b
	wLhhF0V9E9lkW+1iAPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPrS-002haY-8a; Mon, 30 Jan 2023 08:49:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPpi-002hEg-Tp; Mon, 30 Jan 2023 08:48:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id v23so10873238plo.1;
        Mon, 30 Jan 2023 00:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN176PLvjJF0nSpMtEIYwjcbJii9Pi8z010fzWsc/60=;
        b=cXscAbh4RSxdbroBR42HnHiwk8gyb6/G0Apxu4SW9Jmzw5WVnzUvlSDjFBYI+6lTLg
         GUG6F2Uh6UBESCc7yA5ZWTy7WHrPB1j02p2honxyrfZVdEwlSmsFWYFNXnPGsuKekclY
         irbwu4Fl6EMnyxScskWMBSWOBajRyNf0zWoeqSSWHHkADM1JxzJBkpHVA2ZQpqavy3MC
         zt1sFhh1Ff4yVJ67H4Q2wCtWN1j/PWhxFHAcXiAtpbGbKry3hGMjgUyUaSI94INbL2mQ
         k1JZHOE+qHuz/19Tp3AxxN62cLUTQqD7TkfM4K8NlXrGvo6xQ18Fpz6eKPaISDl+ERsm
         zQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN176PLvjJF0nSpMtEIYwjcbJii9Pi8z010fzWsc/60=;
        b=qmp4Eu6FwHq2OSOZ991bezxR6Q3+S/Khdwk2HtL5giKFtjdy9WbYxbZ6NISv5XSdbG
         k2E4qd7blM7UgJYCKCVruHChP/fVkhuzH4ShD8fxsCCGMH3KbR+HdEauGkFXJwTbmG0q
         hZ7DeqZyzqCeX+Bz9hEWuZZf6xrH42qqWZEHfAvED8GJDJaa4ESrucQIV6I28vporHUi
         hOojNEmfGPLQe/hjd+2cf7dJMxcROOmMg2mKJKQy8eBylEGI0sIzGjHxpgimA4L1up9p
         tDXvPXwzioSaU4QNdudXxp9t3SxcH+5PRomUVeqSeHVyalFs5X56UGPNj9Rq6n63FGhd
         b8Kw==
X-Gm-Message-State: AO0yUKVEQaLdiX4x6Q9jayJgZqXb1/rbwTNnegLlBKYuzfBJuttr6ADz
	xShk3L7XgS66MrzhqUrDKcM=
X-Google-Smtp-Source: AK7set/vioIUEgQdnlPNA7bRxAloD9WEu/M5QxMbbZIHlOYs9+i/NPVX2D7Lmax2DyrWZbiZ6Wb05w==
X-Received: by 2002:a17:902:e312:b0:195:efa7:d54e with SMTP id q18-20020a170902e31200b00195efa7d54emr6247255plc.12.1675068484622;
        Mon, 30 Jan 2023 00:48:04 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id ix1-20020a170902f80100b00192d9258512sm7205284plb.154.2023.01.30.00.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 00:48:04 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v5 1/4] ARM: dts: amlogic: Drop superfluous dr_mode in usb node on odroid C1
Date: Mon, 30 Jan 2023 08:47:40 +0000
Message-Id: <20230130084744.2539-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230130084744.2539-1-linux.amoon@gmail.com>
References: <20230130084744.2539-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_004811_031614_75AAABCB 
X-CRM114-Status: GOOD (  11.77  )
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

Drop superfluous dr_mode="host" as it is the default in meson.dtsi

Fixes: 3325f3e4534c ("ARM: dts: amlogic: Used onboard usb hub reset to enable usb hub")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: none
v4: neww patch
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 941682844faf..1097b35b7a49 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -368,7 +368,6 @@ &usb1_phy {
 };
 
 &usb1 {
-	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
