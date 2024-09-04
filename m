Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA3DCA0ED3
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2024 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uw2N6FMcFvO1UAhWXalJTiLyM061WCh1PZPkEUV5m5I=; b=oyMI+uVO87oAVy
	D9tAgjPcleb44KzZR6oTRVbB5CZGkHirB0wQFhY16nnW95NEWDsJTabJ9LRPXLPE09nzSB+6H0zz7
	L3c0C8XQQBwbgg+v66mHu2Qz7SQfCGKSSRuxPVssFQ/ugpcCmervFR7dKxVcoZ1ElUsKkqvllX0B7
	Hs7gW5L/EFR9OzROnlzWw3HDAfFIZTsiFxYlvhJ/qzWtEQoQy8+opIR9xSThxFzvRQiFuNcRwSNF4
	n2ETfBDuRxJc/xSmKETNXfKTCZmqc4hXAkFJ9U5Is5z2aunFHiv6dydyUSPFmXeLQgbQRLCWjUjtw
	x9V7tFfvHBc9x0pzxZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slkev-00000003ECP-2OpT;
	Wed, 04 Sep 2024 07:42:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slkdz-00000003E37-3bNk
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Sep 2024 07:41:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42c7bc97423so41921785e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Sep 2024 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725435694; x=1726040494; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ktJv7V7BsrY6lxWQLsF6JOBPSNpEG+StF/aANqrJ2c=;
        b=POU+xa7DNFgR0uIRNxa7b3PLgNueKzGFObKQZu3ZtbPaQ1ibk9oZa+DHcpAiln0Px6
         q67NJsFr4LsoJgGMvIwFkUHPjz0elF06vWodBYt6pvD4pKIm5qCuyrjnaT8D6j/+5L2W
         AxjjYemseNhok6OEZBdC4QYbRQ5mu5S8Kgm2B7NR8aJl/6tA+hXo5Xq8sp+7SpSGxYT9
         W6/lhFB0XGHu/8L6gr3/wjAJ1/7F19NKwTZ352RJDT7zdUiRnkUBOrM7lSKa+m41D6lo
         GmEVXsINDfoMiGH8/MEtfJ0Qn6zSYRwJu20AFMlgA/UOTtL/tbPv2m07j94O8i5sLuKz
         +KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725435694; x=1726040494;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ktJv7V7BsrY6lxWQLsF6JOBPSNpEG+StF/aANqrJ2c=;
        b=MG2qvc8V2jQcxkzFWXWlLmdgsdZWz7cf1IhbzprvuklKXNFPUgsPEHiOR7JVpMf7Ny
         zpecj1LNCGwMVaEpfOBZz9rUuM7q+H8eBwhGgkI3skPXDrj1y6kXjwn5S7zfOfCPxMaY
         ymToObRIDL7org8s4bjAdvcKJWtV6VbQUgleOsJSuU5P9y+BddeVpplZCIgnOLIeRZrJ
         0lTymvE7z306KTwcNsS8rQfRCnoH3JDRENgyhBBAc0pbUYLwIzGeTdsgSfXses9qSQbD
         c9Ae14qvDxvyGcQxN0ZmWryUd/tv7SbsLOczFabru7fW/uHURLI+LeS1q0PNdA8PvK5j
         rrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB8jyULPvBfFHYlUiOxwYdMW+6lYyn06b1BxJLhCR8L8xd67WVsgNoq64v7o1usgF/UfIlCcEk8G3Mivi8@lists.infradead.org
X-Gm-Message-State: AOJu0YwZyaMH0NyS6vYozLr/aNpi1LeKTXWMo7Jpll4PuGnHIT0OkyE6
	3TFaazI8ItHYLtQi6I9dHmK0pSXL9WmoZzsQtchpCP7tVedbjtgvFvJIVAtv6uw=
X-Google-Smtp-Source: AGHT+IEUGTueck2wFIO2xgQtM82YXoUnrNJGV14z+9hEAlfrmGF1YjQsrCNhTbaVg6SSg7pq7AvOuA==
X-Received: by 2002:a05:6000:d8e:b0:374:ca1d:85ad with SMTP id ffacd0b85a97d-374ca1d8830mr8037393f8f.56.1725435693139;
        Wed, 04 Sep 2024 00:41:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef812cbsm16229212f8f.83.2024.09.04.00.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 00:41:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Sep 2024 09:41:31 +0200
Subject: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: drop saradc gxlx
 compatible
MIME-Version: 1.0
Message-Id: <20240904-topic-amlogic-upstream-gxlx-drop-iio-compat-v1-1-89ad63aad915@linaro.org>
X-B4-Tracking: v=1; b=H4sIACoP2GYC/x2NQQrDIBAAvxL23AVjLLT9SulBzMYuxOyitgghf
 4/kNMxlZodCmanAa9gh058Ly9ZlvA0Qvn6LhDx3B2usM0/jsIpyQJ9WiZ0/LTWTTxjb2nDOosg
 sGCSpr2gf4W5GQ4ubJuhFzbRwu27vz3GcJfBl7H0AAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Qid8qxN4GgXSoeK9U8lFaZNfbor92P0uuXWDtdswoBI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm2A8rsr7kWhI533NglBEyxt/ZYZF5X3Z0vo5qlyQe
 z2dbrYiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZtgPKwAKCRB33NvayMhJ0QMKEA
 Cj01D+2OgeAg3xlMyNviRxY2UQbi/fm7Q+wEUMp3BO4NuW8b13oXsNDx1q+diX5VEtd7wfHu31zeW/
 BraOC+zjRejMBanfZFvqO2QIR8NRrFwoLAJMRN43ZyRNKwFN9kkP8t9opQpZ085sUJ0Yj5R12fus6R
 M6zEQwWBvIMAJueicPd41m1ts4QnuTXLawJI1RyhCsbV0crquH3g6ImRSOcxvqEXqg60hj9U1HnscI
 wP8ZlhrfkIPfXqaMykmo7MkbV/i/tQViBH6o12Y1kfIlaJFPjZaLkC6gSSUuORXqtg+naZXbcYd6Ii
 fedAibH1RAp0yzoWFGiNf8Xs5a9aYmBkhxj80xLF3xn+oztrSmRJVoOsFIGMr9MJA7XIkfsa/bTElq
 jl7YnG8vUJiZbPAtf6Y3IODLrE0qnPnv7pJ5aIZjhuIL5gGd0HfOg/mjpqj3fImNgfQqNLpmzOa7RT
 Va8Q/zv4CVKS88BUesKUYT3Dnm7bPuo0VVH7Q6WDUTb0wQ0Gu2c8ukS4OvSDpajKewU3OsXgMZlMKh
 MH7ZuPyYSXOHIE5Dj7kZ44xzcfsWvwhw3ZccSC63esxffBI+u0R+jl8OFaovE5IE+Bxofn8H5BnbIR
 8Kao5DjzHE/qZmOjkYScUKwDLLdCPvPcXBPjQisRVb+9QC2tFx3mdGT2xqYQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_004135_934309_E432DF2A 
X-CRM114-Status: GOOD (  10.28  )
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

Drop the undocumented amlogic,meson-gxlx-saradc compatible, and fix the
following DTBs check:
/soc/bus@c1100000/adc@8680: failed to match any schema with compatible: ['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc']

Fixes: f6386b5afa81 ("arm64: dts: meson: add GXLX/S905L/p271 support")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
index 1221f4545130..8af50afea860 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
@@ -39,7 +39,7 @@ mali: gpu@c0000 {
 };
 
 &saradc {
-	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
+	compatible = "amlogic,meson-saradc";
 };
 
 &usb {

---
base-commit: 6804f0edbe7747774e6ae60f20cec4ee3ad7c187
change-id: 20240904-topic-amlogic-upstream-gxlx-drop-iio-compat-28c5010ef433

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
