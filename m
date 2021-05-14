Return-Path: <SRS0=hwcs=KJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097DFC433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 14:33:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B6ED6144A
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 14:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B6ED6144A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bA/ZYXy5qMR/xK6nWmRJ+nkne1+jcXLZnU3Me4qhlNg=; b=R2y6V2Vl8nVXxJTaFPzvGVyg5
	44HWj3o2CipH1Nw23NK5CnLnR0PMbuBGnE8fQmkBRgynQJ4PIqzu1PJTsKQLNXnzLzP7hRcIn2jxv
	Rty2CTY+iaviRlnvHfzN8P9dHHZqPboIEM7KRstL4hj5VOX7YnCnjJ1WegHPETFS6lpHt8XJZ3gWU
	pqlgucmoXl2AyM4uyE4aHXh1Rvw1dJ5GZq+L/7GTTAXg1l2UMLY7U3N988gyBaA5Q3WkT1D81ETmK
	Ka+tRMPFT0y4cMh6aHoQj+aBNfK3VD6JFq6lb8TmaqPIna+oSALnUVYT6nkdFukV0fzepjQuhm4Ak
	AGqCY05Kw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhYst-008IVy-Cx; Fri, 14 May 2021 14:33:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYsH-008IOh-SJ
 for linux-amlogic@desiato.infradead.org; Fri, 14 May 2021 14:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dAsKBCUtWvT2TBc5FQFA2vVLxfmKKkbA3qujbzupPfM=; b=nX9GswjVpqweEehyjqP/SR+hW1
 Y383ZPv3S7Av3geRsNoZuuYB1bI3c/HQBuNdaiMVl89rnLMyjJUZ/WWGnwAqH8+JQv4E9n2SHeYB4
 i+Lib9+/n668kVGQZ5SINpUfZkmQrSbf3t6M8WHUt0wJeqr5uOXL3jMymZ7/HaLWwjgKHFq7WRqvD
 B+T3+W47IGETsIknIddQrVArDhXyfkgvBqJxkPWoyYnAeJ+bITtNX3hnBAqf90gekEBx+EVuwOjG2
 IY+OmLW9IoMXaS7A+Z8zaRVX0brDVicOPhBvItrhK2w2IPbFinMK5Go5pdmzadYv/RnsGHbjqQ+tI
 TOmdoiyw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYsD-00C2lm-UV
 for linux-amlogic@lists.infradead.org; Fri, 14 May 2021 14:33:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id i17so950264wrq.11
 for <linux-amlogic@lists.infradead.org>; Fri, 14 May 2021 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dAsKBCUtWvT2TBc5FQFA2vVLxfmKKkbA3qujbzupPfM=;
 b=fRRNd//FGa7QVc0likppjcQv7KM9iO7gKQUNmRCd1gAxsArkyy9+bYMptXd+ck79pD
 OSIA8Ve5qcCL29brdwIVHuNhfZQZJsew//87TJCzgze9e3UqghsGUxHQO/mimWtYUpZr
 5kM7M1FFL3mHUrs8z3v7L+l4myMyn132fE0T+QNBbGMa1FpAF+2Uv1fLEfQ4J5qN7SFP
 aCTebmRBsYCWoOnUbnLrFV5IyDYEYeztqu9vgkRjW2o3FiJLtipgX3/fYQkPw8xkYOrc
 NviPYk5Nru3FvuYiFRzks2iCMXaUGV8rUsIIkVt4JU85HGTKToblvbyIuyDROmNQsQYS
 2omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dAsKBCUtWvT2TBc5FQFA2vVLxfmKKkbA3qujbzupPfM=;
 b=JWzd2CwL6UhviCNTfqCJndLYrEnmHVD+sxra1Wlp4FPGJkdcseJVgd4cGcMAFYpBWr
 CMbmYyKESnVZyDk8Rp0Jl0MwL/6N635d910pFKDi2ZWtjU+VJIr4VODLqvdbR5Vs4//e
 2Xb3N8an2ueUfT5mLwolkeuJ8JSF17bA6qszlbIKwxciZ+u0QPGXHN0goNnYvRd7Nd/V
 FWr9olX/+d2QwlT+NO8K4SK1jlKcQJKXCsfo+mMescZS5oU5As/JFNsgVZc6fNqmPelk
 oqFj8UxOVYEFP6kT/BXZ+X/+863BbzmYx8nEM5Kis9h7F8gh69crhSPIzncw2TXPCujw
 l98w==
X-Gm-Message-State: AOAM530gV2YEWCcTxVBZzec0oz5BJSro1unlByCcGVdX507N13DOeNOF
 Kvr5BQV0xtwqEWusdM5RIBBppA==
X-Google-Smtp-Source: ABdhPJx8h5teAgdXD//u9XMzxdRx2sWdw/oSiwMevGN6xDDCQ6y7X2IT9xVohMJgiOXA0XzSoLGSkA==
X-Received: by 2002:a5d:58fc:: with SMTP id f28mr13300656wrd.339.1621002782937; 
 Fri, 14 May 2021 07:33:02 -0700 (PDT)
Received: from localhost.localdomain ([37.173.48.34])
 by smtp.gmail.com with ESMTPSA id v21sm11552036wml.5.2021.05.14.07.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 07:33:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 1/3] arm64: dts: meson-sm1: add toacodec node
Date: Fri, 14 May 2021 16:32:53 +0200
Message-Id: <20210514143255.3352774-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514143255.3352774-1-narmstrong@baylibre.com>
References: <20210514143255.3352774-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=PiBOxGF9B8KW9XPjSZyFe2Ca0fRRv2NCjlxlTSICTK0=;
 m=JPhUMX0KwAIy028CLaqNkk0VSurj2OC9d9a2+coI+IM=;
 p=vYSSa/Es1AGkZ2S88vUhAsnn0Rd+dA2FIygyN1JQJ8o=;
 g=6d32934740ad81bbded692d5df351bde49b9be52
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmCeigcACgkQd9zb2sjISdF+/g/+Lhb
 xiMDtRbHkd1MEA2ZyyZpdWfunqAzGrDS2UfXjRqC5eir7L8l2x6F07v0OPz2w46ekg7Ca7xB9fQ3S
 UVQllt/kIVmKoOtoSvzMMzkmgePKnN2alMsRQv7VKafsRAXTfBtRIUnL/D6lyCaFfHpO5ko30cAd5
 Lrppjn4jgEMBInCS1DisKgVPDGRme186EGVmZrQpDTz76pILuqN9r0fqJU1nULS45YNPCLSuozfH4
 UV3E3xeVMnQu8Uolg8r/JjcY3PDjjA/TpIUNORzX97pMtnDoYxsD+b6+i4IEiFY7i30EponsyU787
 flVB93qG6EqB6cB5yFIyb/L6soTRd9N1UVLCBAOofA3PXRcfmFq+7EfNRoaeUfAh8aMkqo3QJK+tM
 8JLm6HJy2dPnt/7MA1OxyvAPWIR09GcD6G+lqL4Auy37wwe9Ht2DxSfLFJSw+Sxl/pp0Bv+XsKB3C
 QojXhhgJNv4JxPTckDDaiNc3/655S/jgi7as8rW04BlRaHQ7EYqUUf9JyBra4l0kmzDQQOsGC/tp5
 D48RoCyMQjsJfGAwUBkl3QyFA5F2XbXxg7TwNEfBwAS1QVVJPRmuc85qZV38DMATBsHMdxi55xzpA
 S0iEvNpy+cmxbAA3g2XbRK5VJQZL3shBNtXMwMdvZwSiS398v34c3WPenNWoXWcg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_073306_000353_581A2B27 
X-CRM114-Status: UNSURE (   9.71  )
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

Add toacodec node for Amlogic SM1 SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index c309517abae3..3d8b1f4f2001 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -401,6 +401,16 @@ tdmout_c: audio-controller@580 {
 			status = "disabled";
 		};
 
+		toacodec: audio-controller@740 {
+			compatible = "amlogic,sm1-toacodec",
+				     "amlogic,g12a-toacodec";
+			reg = <0x0 0x740 0x0 0x4>;
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "TOACODEC";
+			resets = <&clkc_audio AUD_RESET_TOACODEC>;
+			status = "disabled";
+		};
+
 		tohdmitx: audio-controller@744 {
 			compatible = "amlogic,sm1-tohdmitx",
 				     "amlogic,g12a-tohdmitx";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
