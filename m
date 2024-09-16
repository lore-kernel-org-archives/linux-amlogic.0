Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D282C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CD/iV/4aP8Y5qDYuwLhSmdRTb/OO8ZA+Ul3yTtljfL0=; b=LhEqyJkHHULess
	/bK3fel96LLVRP1Ih/73yQowFa7OvxWgLY0yX7pXTqj9+an1rlPoUHJ2/RwU44vLXlY0cBalXZWEp
	/QMxz6vMBmtEB0vQET15D+VeC1CaeaNmhjp7JI4dWBLVI/tuD+iZwaA40hVMXaxpPFaVQSt3/WTH6
	03yxnDjuSiCSmXo8rpE7UrrQ2GhCTI9JvBccLoNgGJuVtne0yhqFRtdvHqub67aVCKKVTDxkY/d0A
	ScadS4vnr5/jCljSeLMaFhssiAooDfyPAHxAl5pGZV+acKJp7s/Gty597nYLJiqrGo2WzOq7RO6pz
	13LOS2MDTB1/j6pk7E4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6xZ-00000003PVW-0rx2;
	Mon, 16 Sep 2024 08:19:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mz-00000003NHY-25HR
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so41043105e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474132; x=1727078932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQC0+5hP/1T0Fgc+KCuQoHaqJvJj0T+EzK9HCAfjIY0=;
        b=dTfwVT+cfdRWg4PHbZKP88yRO2bH7VU3vMKtEpCvSja+K2uTc1+iZCIHNaN5MKhDyd
         J1nLwi3oJs3y06RzBW88lnfbSyi2hlnIk90HRgng3sVOHUD4RaBYHN9S8gxuj5Jn6u9R
         O3Ap1dnb8mpQW+T9B1zd3mR2GtJ8aQuUCzeqmZ3Tsn4+r39jRvX2cXSC7ZdITLF72sNl
         yNYwV1Kf1MJ+DWIsQQfAWqAUtUK4wlIDuYQGEZhJZQCIGal9Ctrac36gWuVzOEOmD8Eq
         pSNHs8EyiZbQqdPXcwoZePmqlRDGRq6MWh3gebwWEApK0k5nqrkDvllt8E/KpApca2jW
         9i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474132; x=1727078932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQC0+5hP/1T0Fgc+KCuQoHaqJvJj0T+EzK9HCAfjIY0=;
        b=NW9C0Rtz6C9OizIbHm8EK2ZMqLGJBB7jvc2q61ntnof2q2/bSHgrFYSG/SYzqSade/
         W2syyHlcCWv180qhXvrkR7n7CFJZM+e2gZxLo+HiFahnXM/0+q95N+rehEf6sQMpvYBz
         fnxZ+dKzN56Qrn8l4kEYirL1xHxGRpZYFRTHs10h54cLDt0Kmq/sL9fZrpD1cOjCTeZ7
         Xv/CxGm9VyBDihjmNlbKJAT7ngDenObSmwHjtY1oDNzgx+uGIR4kJEdvfWHok/1/nxfl
         Q8b9CGisPfF8w75DGcyh9EEgp4TYKqsZPO2+wNobDKzQdrRalTrJvfLKhMyXBHYV3H+S
         LI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8lET0nYDUBhcwjKSPGjOSaq5kWKAE//rS0AzVAjFsbyAqV2Qo40YhGbM76H528wDR+Sm3GwEOd/pU02x8@lists.infradead.org
X-Gm-Message-State: AOJu0YwapMWFBpQu4Nn4nq41j1ZsiKvK7l+Qb27VHpgzkS44tmKcBEkx
	kcN6NEtSMAKe6n/9kq1DO1wPMEL7F3RYA9D7JvwKNr3e3jfeqQDIPUdAZ98tQ28=
X-Google-Smtp-Source: AGHT+IHAmdE+C4Ny+gNfup365f+6zmP5ZLzRemJ0I5Wbbn+DfBKRgM9tmGdVnB3sx1dgY2Lw9+gcBw==
X-Received: by 2002:a05:600c:5127:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-42cdb5790c1mr112391575e9.29.1726474131902;
        Mon, 16 Sep 2024 01:08:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:39 +0200
Subject: [PATCH v2 10/11] ARM: dts: amlogic: meson8b-ec100: add missing
 clocks property in sound card
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-10-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cmbD9RSCCT9wTN38rVK/Aa33OtoBLzkdzuJ7yqROYWU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eI8cW+bUfdg4DZyNafDYP2+CdVzJJzD9efY4Xx
 j6Ng3TSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufniAAKCRB33NvayMhJ0YkdEA
 C+VZKbrOGWoZzSPCpesvMurV9hC5A7d/5PqGNfZYgJ2Xp1zaLi6ydQP5JVi3J/MFQ3luSCzFMPE+pa
 hdCiRMNAzGczpIdpmmNiChVdyLbnipVh2dqfRyaRLeJRMCIqI/O4x6w+9MLwKDYfrMxJKqUjY9EzXg
 Ik7gRPNBFwiTfmjhIMeqkQAmYgDh75L/IVZ1u5VjbRdWk/3GPEl4A7sCdUS+amOWRpCuazP8DtNSJ3
 kPDCeQxJuPSvi/mR0KpBlQNamQi33N6sdyF+AbBS4pJqLHRFzz/v/2ff49Py6WGCw6XpNqXJEWfMH6
 AkmmeJkijnsI+6ituCXln1Gl4PpQBJ9zqVXSPTvcgYqSzTsECreWxXMvIwDUPxw/a9emtW0rBFjJV6
 qzVTcT6+I6+YbE0+tmCPBLgoRVH+FXJxrPO7VbczYIAnevSBzY4I2hLf0WTgf1qK3GrgOI3GdjJHDR
 nshm3KwaXeuCBypW9wRu0eMuu26o/2TBGeU8YwvqkGDJ1OTztNvdJUSWB7RtPCgdhIQWFZhzBg5Eub
 zh23ngrpDKFv+HiJr/C/OuPs0t0B5VxJDuR7ArsY5+K29W6tIKjETaAII9hNg+zEZdeu18KruIUYeG
 mEZh7vBZ1VDxllWtj1R39RN5iaevWH8bHYbOo9Y/eyGR2tBJdyuHxF5a+dmA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010853_745719_1145F6A2 
X-CRM114-Status: UNSURE (   9.14  )
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

Since [1], sound card must have the corresponding clocks property,
add it to the EC100 DT, and fix:
meson8b-ec100.dtb: sound: 'anyOf' conditional failed, one must be fixed:
	'clocks' is a required property
	'#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

[1] ASoC: dt-bindings: amlogic,gx-sound-card: document clocks property
      commit: f189c972f86b00318cf2547b62e461cb98374e34

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index 36fc3e15ee9f..bf1ef07de6c1 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -98,6 +98,10 @@ sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "M8B-EC100";
 
+		clocks = <&clkc CLKID_MPLL0>,
+			 <&clkc CLKID_MPLL1>,
+			 <&clkc CLKID_MPLL2>;
+
 		assigned-clocks = <&clkc CLKID_MPLL0>,
 				  <&clkc CLKID_MPLL1>,
 				  <&clkc CLKID_MPLL2>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
