Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C8FC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUrjxc00Bw0psKYCidAuX0bctEs13EDjlkCLEON+0AA=; b=L0sp1/qwUU1Utb
	bll980Q85TcnTR4YeSfy3+q7NoSnkK65sxktVkZDREUNSXlfqJcry81iHthvv1U043qhwrWXGhKti
	y+oYuMNx2sARnziCGoqKh/KobEae1QSss6B8OxdFexhKH70sbtjxVEYZUVVGzpgANOEJVtPMrxAxA
	V5PSL0eUvP/Q57gfDEEkIspAKmY5XA+0CUI2YVDmSwHUeANMYD+X96ro8YAMJFyUWJTLGQsVdJTyB
	bz1ZGtyy7B5Qn4vsGhw7kqDKjDgDrh7I5vs86H3Hpi15jssbmdYulOQPtgta77TFDvjaBicFUZdvi
	CuZGX1p4a/GtkAqbBOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nm-00000008uiN-3HY7;
	Thu, 06 Jun 2024 08:48:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nH-00000008uIj-1CyQ
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4214fe0067fso8117545e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663702; x=1718268502; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLN9fK/Q1IJ4qkUSkkhIFN2WinWIfdWij0oNshXV/Tg=;
        b=hAyA2utswy3ft4VzYLKj5812v+I9sdyz6sb+o/szmnOaEkKZpqCCqzjgn6Q+ppnffU
         cb0Ar2VPPlcuPIKJYng3J2pJs+sWuZb83nVykUUtWBSpEPCCRVJ9BJAW7pdoNcPoBXJX
         ZxhtI6x+VvqSFHImPwpyY4pyofiur03MeCudsx7djsF+lKR4COUnoa8LKKetACLMEcB/
         XEQazVktGOz1NkmuLH6smohox9xWJZIhr5rmXd8LzFm92/+MwG2qi1e+MYNm45+myPAQ
         8onZVVT8wWXoqxa/y/oV5oaXxGD7HuI6qc5ujLOiHiOe5cZros+IMcO+yEM/arnsVnfe
         npRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663702; x=1718268502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLN9fK/Q1IJ4qkUSkkhIFN2WinWIfdWij0oNshXV/Tg=;
        b=NXjoWuGA/6ARvEVywBRUeqa0xpnPZ6OyWN0UvRy/exTK7xd95GjZ1IBh09aygsiLeP
         pCB6nTK3pCgLgL+tO3TU33q1mHLYllFcVbtWhK6R46hhgTkdJztJKolwxQW13kUgeiwR
         xIPy+q3H0c8+PyfGjOVOKZJVF/ZMQ6QGjWmd9IgqEPmpiXP5Frkbtp/JqExIm4RT+9pc
         3iSttnyQrIEvu+0iMq98jnZRfrcqQAqiYG7EdrnibcdFMAFLlWinJbFhDKqYgC7zEnR/
         rQOkGfdP3YbxVqcbsPqePsnjW1Eq5mG0zNEzNxDPmrkyIjgZujht6dfF+h6QxkuAK0on
         jXpw==
X-Forwarded-Encrypted: i=1; AJvYcCVcCIeoGp3h9hh+wH9zo0xk2THbHofXrxxQ8g83iasZr32eGgrVo0VCKOoCs5T57wceGmR90M70z3uRGA9TANFazFfmBYZEUyxqecSvHaLo6Nk=
X-Gm-Message-State: AOJu0YzsdRdi3PTI1f5Cnn4/EIcifEVTi/DvHvm/fagomiHy7SkMXY80
	WqltoCd4zwzX1DYBLZuA/SPauFAAoQI5BKjqATlpAo3TmVn7BJY1ZN5eK9a1D/s=
X-Google-Smtp-Source: AGHT+IGSktBg3igi8GWb9dMcYgXr4zEw/a/r8SvoK8C+S3AVdKHbOjSJxzo4An/FUE+mEFAirB1IAw==
X-Received: by 2002:a05:600c:1f93:b0:421:b79:93fd with SMTP id 5b1f17b1804b1-421562e7053mr41861205e9.21.1717663701851;
        Thu, 06 Jun 2024 01:48:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:14 +0200
Subject: [PATCH 07/12] arm64: dts: amlogic: g12a-u200: add missing
 AVDD-supply to acodec
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-7-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=632;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QM5KvwfkUBuCDEX5LFM5kIWXkN8IDPDmIiueKWnAI5s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfMvEjLwITtzgzOM1XlPBOixFpTSMM8sfqbyqdF
 jR8DHTSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3zAAKCRB33NvayMhJ0Z/0D/
 0bRThBlCqq1W0Khr0Zfszttq737tMTpibC2xEl0q2XEFXFkrAaBCa8Zwl8TWdE0Xqb/xuP1IXUFs/3
 pXnRqbQU8sdjX2t/kSCFK+mTC8wh0hO0aeJS1ZICcTyJB84VFBN6Rr0rK3bfXHJEZ041r4m25gRmXn
 ZnYCO165uSStzXf2YCZr+aKjWI8M0nA03xQGKo+98t5IlK3+05GeTvWm0+2ec6eXWcNYEgUwmRsu44
 1OawnEzUKdYmsuRqFVNDR6TMIH4NpGirQmXU2Tci8wUEB7062XLYEyz63r77f46ED6i5w94S90ef4d
 UhTpSZYQX0Py0VsMu8kg1h+uDI2+jLQz10L3a8C0NE+v11Wy0kq6lSOprWFZboK0g0FP0YffEW3IZ1
 ruDJQm6B0bjYwavT+yDWItMCLy61OJWbCTgS5lH/EESO1ZYWAJrPvmOO2onkNyHPmhuYa0p988Omi3
 bCJqx7hcNcVsvGaRbs2obDkfnHhN1Yodh3KnjcsrH1p3PEvMfcW/MUW9yThsoyxldfdfrk0RB9hUgB
 6kTY4auJ4Wr9VC5S5rr1jj9u6glDRJ5tbv4I9jW/BbAQyGRr+i26KBYlo6zoVazkR7GBHWCfT9BoqP
 a6LLIe9yfEqabV1Mx/R+zMwKyP+LA8CBKXVfipCS9x8IjYhE23UKrKax6WWQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014823_528625_A17265F6 
X-CRM114-Status: UNSURE (   8.08  )
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

This fixes the following:
audio-controller@32000: 'AVDD-supply' is a required property

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index e0f15d824249..7560e471c56e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -365,6 +365,7 @@ codec {
 };
 
 &acodec {
+	AVDD-supply = <&vddao_1v8>;
 	status = "okay";
 };
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
