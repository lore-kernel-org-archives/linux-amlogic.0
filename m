Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEA2C5AE59
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=soIkt8cXDeP4tlY5KK0y34EW0JkKPhmX1Pls2FxnrM8=; b=atrNNqTwZ3nk4Q
	EXg9n3S3W8RpC+dUP3a4iZjSRjyda3AvMWwc29Y6b+TUUROeIvXhM+gwhJ1GMGotwF3HeCgB+/0g6
	UJ/AXhbq0mmnqSOI0kK3UMC/STVDUjyMgdeHTw1YD0NBaVwpevJmx7fINhVKIntmyXg5rOLpOkpp5
	MiTFV24ygszGsgUWZgDLM0G0nEKexDljioURIHKU2KTl+wXcpZc8XeemAIoH1a8Aii54uBypt8lui
	9ykEQZVAm4SQnnHgIbbSKGqBZDGKw243UpF/YWm95VronPW6g7N/LsTotK3pKw7qmjMGgV62HABEW
	kVa2x4cbczxk/KYxnEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMPC-0000000ACTC-3llm;
	Tue, 03 Jun 2025 07:49:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMMz-0000000AC2g-1wvy
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 07:47:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so2299133f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 00:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748936856; x=1749541656; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caJ7ux2yumSI+rOgZYfrKx6bLw/EgXNi4UXfiijyCIE=;
        b=J14WX4sKVdt0QSMGcSkVQJl+VKfAertmwOvjqlJGye5TQVpSYbFxi7Ck5eKgvvAIYY
         KYDxP6+uyBF9U1DSg451N3BwlfxbVHQPQzJDYmLjUzG2actm2WNDqCyBKuaFhWwT9TpO
         2W6pcBVdPDcQLLChbbHmRtwyRkFMnyMLoDp6N7xHGl1EjTJxoqox0xHRk/zOWndX/IAz
         4oSXpmfI9RvFFKVuY9OVQKXo3BxYIufB4hjS9t/acfQJh6v/b1C0PBGVP3enKSfB2RAG
         d2RfEtJPxEOFCw4XJuDKE3ZGbEUunAvu3MZYUTlGC44atL9rGW+ePh8FlrE31f4Kdrh9
         zsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748936856; x=1749541656;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caJ7ux2yumSI+rOgZYfrKx6bLw/EgXNi4UXfiijyCIE=;
        b=HAh/BOCOxa3/F1bnEOfRQSQNjfmhP5qvNhaPDznJ1m5j4l6x0gOEXiq0QhzCTDRHjR
         bibDirNec+aKB1pVLM49g/QUFdJXpkArKu7WJIz47HmM/vWhfLkutsnrCwDptF6cNoPz
         W4sJOrS9BXPTLyNBshBpbRlferyYsFZG10UtL769/bOUv+XgPw4dGnl2G2sGBAgYgVz9
         N4GvaG7Vm5jzDvz1njTIu8epSCnR7GIotnFUyU44nITCy0LUoUHPsxODSTIX0XDLL0Oz
         toJKSH5dYcIBuRVyai7hubvzf5Oiq7mTYc6wdZP8CgB4SmX4s4PqaL65EW9N4le558Vk
         oy+g==
X-Forwarded-Encrypted: i=1; AJvYcCVwmxb7sV2rsYJPDKNvX9ZiVugSyEGRRcXMj8XdYhZQX3932uJ8XBi34YdKvU8tLuWm3D9Crfa7F/jkleAM@lists.infradead.org
X-Gm-Message-State: AOJu0YwJM85tkPUN1sScFbAtUy5KCgLI9LSnOYF7+H+M2ld+gwY7n2ef
	ULAD8GBc2f8lbMEbKifLpN09MQEkjzu8qi5j1GL5xMMGBRtH6TZ3OcZ3w0vLGaxT5itgFRz2/Qm
	hCJUz
X-Gm-Gg: ASbGncshrN5r2q9Bi83gfqQAsiHe5VJsoXaplUMBWmA8PXoTPSQhpl3EGUfrgSUKMdu
	C9hfc3gO/kATKDRw66XZcmYsOOJE8XMA2zESu2/3lmekoKx79c0iUjqQ+gvBO6B91HwwwotzVG9
	fGVFXCRYKI5Xi+7CP4+6BmAhujKRSlfZDE9djjNMg3wlIH/JOKl7nYdFXnN7w8cGDbuDsxZid4W
	9ViEM21oGedZuuWmPSPGbaNfzBW0VpSz6QkzLFVsTF5Kwr/W0LN79RB4mxmW1UoARcAbf9sLTD1
	979GC6baa7ZucR+lZa0BX+cYigxISrY9UF/yBue4bUm0hqFItpui0X8w3cqBCiEPACkYtNUQ
X-Google-Smtp-Source: AGHT+IEDZguHy26GTUwFsHWSzO/bLYq1dpznuDMKPsYMZaUuQBDHm6dBdCH9NBhwEc0SzxYYLbe17g==
X-Received: by 2002:a05:6000:4023:b0:3a4:f723:3e73 with SMTP id ffacd0b85a97d-3a4f89a893emr12077391f8f.16.1748936855700;
        Tue, 03 Jun 2025 00:47:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm152181815e9.1.2025.06.03.00.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:47:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 03 Jun 2025 09:47:33 +0200
Subject: [PATCH] arm64: dts: amlogic: meson-gxm-rbox-pro: fix wifi node
 name
MIME-Version: 1.0
Message-Id: <20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-v1-1-2d54a476757d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJSoPmgC/x2M0QrCMAwAf2Xk2UC2URF/RXzo2lgDri1NN4Sxf
 zf4dBwcd4ByE1a4Dwc03kWlZJPxMkB4+5wYJZrDRJOjK83YS5WAfv2UZNyq9sZ+xUVylJwUX/J
 lxdgVW9lyxBkDBefHxd/IEdi3Nv5Htn08z/MHSS/1noMAAAA=
X-Change-ID: 20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-c0c5a1ba8050
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=84VAWVFlPhyzrCXyj2+DcTr+WKL+4wxRMFJtq/MQ9Mw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoPqiWafsssuKl4aBXXalW+12j2G5hJWZTyeYc05Yt
 p3pu+16JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaD6olgAKCRB33NvayMhJ0V7WEA
 Ch3KymIceqWdnWOiU5bsyN+KN/+/qIw0hdpFG1GVA3q5Sb0lbC8MnMaAfqQxoT535Ny+BvxM8b6aht
 3nXk5//79gXMwRFBhwFrmQRRAsximQ8ZMXLYS3AP+ZhRBes3fZeGL44cpxiL4ehOqT9JVio8f9CVLo
 wGurl+h2qwznwfg4d3pQhyWOZQYwm2WLMsfxHOPqZGPjqBOr2kf9a991KOpgeJv6gNMbrP7JGdbdOr
 3rY46RNuiBB88MpGa/jzZuw0bcWHyzGifAPmuR+Ye0ngJjbp3SSbn7jDNBxYkH13KLs/8VF9KddADc
 1gN4PhjgVq0KJ9IdIq9AiLIvsJS/IZFTNsmcpvFiI0Tdf1/nXcqTTs6d8OFhVP6IM31mD4+Fs9CEgb
 V6Q/eBy2EX6O8AQQHMY08XFaUiwHY9+Tu8vyOi+cDm+U3BzFqSTpzqTOGHvGBaw/Rtp0+us/2fJCIS
 5/thXgW7/syAlRKZSsZre875a8Fs+c1KVbJ+MajHhqBH0DBGg4ZkXtaJih0twQ8Yv7mMgJOUOqTwMn
 vALq+AU3qvyrZ5E9WMvKCDAsxHr6H5CCJxbthtUyLkQUyPKlFzYpDYV3G89eNovoKqkPTzG8ofW/X/
 8vm5pQ/kkw1oGK9LFOsXSH4PzKV86QxCcQw8G5uvtmUOvtTlcsITTyLYTOjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_004737_518791_5B63EFEB 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following error:
meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index ecaf678b23ddd6f0e1f27532059aa706c29fe046..9d5a481b309f7201e5a82b7a91b8ca265c7ef42a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -217,7 +217,7 @@ &sd_emmc_a {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
 
-	brcmf: brcmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-c0c5a1ba8050

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
