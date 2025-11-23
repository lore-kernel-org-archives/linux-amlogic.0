Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56149CFC518
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Nov 2025 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JlO7Sv7Hj/+3CdMQ3H0b9sRZ5tDFGStzFhvI8qsFw/s=; b=VhZzeCnMuu0zS8
	F99qOkpNmJ+ul2z5NVKW0MdziCDuLN7mTHi+epMqgz5USKZuZly4EhaLGh1yZ8UTDor4r+2yNOXzN
	cC7fID6/bfCNJdALqhQUEdgBrFdkKbbNqlLGTOsZqWVsd/6qOlGmK5vxsTVkKicBRsP1dVfpF7zs1
	pncP43h0qGr/Wtj7moXceU4+sIMhqoSRy1TS2cKhiIVklDyEVlVeOLmdqTmE0FwilqPIBqeMQFrfN
	vgvbyoeXqpZKLvhNkAmvoFc+GQtklBjSOVKhucHwxImz/fMbPJnEv9G4Ki/fOzT4kpaVDvOGyRjHw
	chW4QBXM3yELQXiNyG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNDfH-0000000AZpS-0R4c;
	Sun, 23 Nov 2025 17:14:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNDfC-0000000AZoM-0XvS
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Nov 2025 17:14:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47789cd2083so20573095e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Nov 2025 09:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763918052; x=1764522852; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SBUjU42Sbm495ZmFakW4ID8bbWQ9JN9OmAvmJYfmus=;
        b=MNSfvDTl8UHuDNu9KlPNObewfZmhZIvwdVsFGhPXhh/TlTZSLm1kMS6cyXIiztfaxw
         P/UC23t/I20yivGCZjNcOdWaU8CuvAiPfqNPbenUgpoIm9Wk1Je7OWudRvvti8TM0N/k
         b45Z2N14sjxMy0cRvmKiXthW2IsZNrStU6l2dFMG1N2emsNVNg8fWhql4rO1Tx7OjcUS
         hQCfR94p2HLRWao0TE6hLd11SU02UYowXG0iDzqBCE7x68Do1K0wlMhjui/vRrncUnuN
         MY2CfydgfRcU/TbJ9u4oELQgbLeN2v/8omCYTJWnZtBb5kEWHSBUCM56ZwRQGUP6c2Hu
         Oc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763918052; x=1764522852;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SBUjU42Sbm495ZmFakW4ID8bbWQ9JN9OmAvmJYfmus=;
        b=S5PQzmtQA3yo8zqDDpmV//AxKD+xOh7FV5r6RCbAEL1RD0T1VnKHSmu+UriUnK9boZ
         weZbUeO2MlzH2Nu2nyRQsAt0o7cXgq/WyFycIa2Fri71LdkLKD8Ecdg7PU2YJ0GnukUH
         AMKE5X3f+/pYZ/be1p/CyAv5jCGgs/wROQ2fJATRN39Mmf7bCg9dS/sptO+AZmNi2vHW
         oAKefGe3ZHBareJsMzWQN23YF8yqwbe0sb9hnY53abf+BiJjUY9VxarXL1iwsxIissbe
         UUM7w13H5p6CD2WIWMMjO0I05Rgx/M8o2MBoG03agU3KdivDVpLRwBP9vVR5rjgtPEJy
         gUwA==
X-Forwarded-Encrypted: i=1; AJvYcCW6LhlOmzKB0icM6TtG+C57zW7w9p/mHX7SyGTB+dMR3veI1uo5QhTDR6b48cswyiQj7U/U4vWcraIjOpP0@lists.infradead.org
X-Gm-Message-State: AOJu0YzDkQOISoadl8sOVkqFCfnMzQRSj/jG/mihtrqMz/Mj65qwW5ng
	xfwm8WvFswuDm752CGw2BJGuYMSXs7J8YUmvjrlkHROjB2ot/rNzst3W2ZhrLTIUSOQ=
X-Gm-Gg: ASbGnctARBbfykm2v87/qg21sjvTwppOAAuRJ8ZncCC1OAfvjFTrn0PtzLV0qI87A/+
	xDT0PTpaWv/b+zsGZNy1OayUpQF6vx8+tQ9855u0it3SlRJTnCfPmV/PSq0TzfxH7iO25tFfhcc
	1L7nPM76sy9Rtm07077d4VNgJDrlZlighAZHNJ4L2vDerNlOMwRKpOcGMZdVhkOANB4fS89AFfF
	sjed5DCwjNmbVgsA0ULiVQxm7ecu+F0406nJeR5crZLmFm1Ga0tI8hbHettzAnu6BV+lqKzT1fs
	auqlmF1PDL+UQZY3fG9ZKFfwlOQL3iACfuvYiLS1xxoDez9RgxpxLylbpYboznAC5AqYw3K9TVE
	Z0ksMzOQoVzH/wp2CEaa3IdQYO2/bJo2ioJTdYPlTOdD53N5FXmkgWpL5YddBFXZRKJzYn5wUmk
	6oLGBQnuukLEqsEQ==
X-Google-Smtp-Source: AGHT+IEMVHajdQc6mO75+50UqpdHBDZGtu0DQkU6l/qte3nrP9B8VROGytjnVhIoLoLV5NlrKgQsTA==
X-Received: by 2002:a05:600c:3b01:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-477c110325dmr74538475e9.6.1763918051866;
        Sun, 23 Nov 2025 09:14:11 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:51a7:9db7:1d49:a8ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0ecsm151637785e9.9.2025.11.23.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 09:14:11 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Sun, 23 Nov 2025 18:14:10 +0100
Subject: [PATCH] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference
 for S922X CPUs
MIME-Version: 1.0
Message-Id: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOFAI2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNj3bTMiuyMxJTEYt1kC5OURPMU82QT82QloPqColSgJNis6NjaWgB
 xAQqgWwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Anand Moon <linux.amoon@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_091414_316894_E2B47E58 
X-CRM114-Status: GOOD (  10.46  )
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

The original addition of cache information for the Amlogic S922X SoC
used the wrong next-level cache node for CPU cores 100 and 101,
incorrectly referencing `l2_cache_l`. These cores actually belong to
the big cluster and should reference `l2_cache_b`. Update the device
tree accordingly.

Fixes: e7f85e6c155a ("arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC")
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index f04efa828256..23358d94844c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -87,7 +87,7 @@ cpu100: cpu@100 {
 			i-cache-line-size = <32>;
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
-			next-level-cache = <&l2_cache_l>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
@@ -103,7 +103,7 @@ cpu101: cpu@101 {
 			i-cache-line-size = <32>;
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
-			next-level-cache = <&l2_cache_l>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 

---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251123-fixkhadas-c84da7d7c47c

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
