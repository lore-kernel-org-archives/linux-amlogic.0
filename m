Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77582606A31E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zuLQbbuq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IpqZbHoU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sDZMMdUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5dfUgSqt+4kZYAhYIJuY5AA2zFlI7aiZq2O6bG5HP8o=; b=zuLQbbuqQPYtNWOouAUzBfbkL5
	kZP9Ygp+/L0qxnq9pka+JkZrWd0+cudbv7XYszmvW/6ulayDVSWvXlylNKcUaKbneZg0hQ45PJbzY
	pWvPSNINaOXvZ8/aMOTGng1NO/pHoI+8RrOm0klrCFPtr800+F+4F94d5hQ0/39EAZUi0np+BY8nQ
	9xdapM8xitnv/NhlWhxf/0mwPz6kV1psIbCyXzA5OIcSnPT9msOk0CyMAW4dLyhcYksV/QKOSyQ3e
	OpBohlbn26VzjR/ew6y8k+TRG71FP+3mjJOWFevI/OSi3f7YeZEpSgifcUxHfAfiKy/31cJtgq7Ir
	OWbfHV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEk-0000000ELev-2RVP;
	Thu, 26 Nov 2026 19:34:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfE3-0000000EKNX-1nqn
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Nov 2026 19:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=; b=IpqZbHoUQFREhOrsqBcXwMpeJX
	MPCKqNJYYmA7kTbioTNVfmvOMvFxwnmEgBntc2KWPQGNAfe7+K2ImGCXvP+27z0Eo/sRQIXuo+eop
	KbQYCC1QxzgTqKB1ScvojW0Gfso7hd8xOaTGdBMTGRb08pvMINN4mlcq8484JSx/kD+tdmCPN5JER
	1/62pT4gRzNRKB4Xi4Q+hWXarlDfwWLFlXx41r2s4U36cRa/cKGi2nR/VeGYLa/TdLqIYTYOleocx
	mKIgcGwy+lYFcTGvlHip3xuZPf7FBUt40OXbUyJE9wxodyYHZqNpI6g2r3p4Hf07IKiHwA6A3WIfD
	5RowPR2g==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDx-00000007039-0Iq5
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so74415595e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721618; x=1796326418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=sDZMMdUc/fInTIgD/DIr+TDz0/PnwoCUq9LOfphOHepozY7In+yahyxZ2Afk5d37S2
         JYlOFQsOGewvJIWy+e9trEo78d6ToEuyvLSdAmdIcAr+9ZSfvooN+Xg8KrS4udnL8l/m
         WTsL69MYwkN2J0VtnHkwuWqjo00NTa767LCnlTOCT5yPJhKUp67Cb/vfFuBRdQ4OV47V
         zevr7FlgrLzBlBgtHkvQYbrs2cdqm1R8U5O9hETuEVNHhWrSGwrg5gcu89mQC6KrvV98
         tvtFSqNsVAT4h+rHBymIwFzChq1+xuCMrlRXDtHktbh7qGA/HE/JJLAsNKPrVcqVQlM7
         EffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721618; x=1796326418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=b3Mz4NaY4TOTSKY+Wfop1PJnyVqqaZHwunBWswvyr2d2gMaxxVM7EAsALQIpz0kFwJ
         XPagdqwohBPA9OfQPsbrfJK1CXMNxWyPD6Gh3GqMFHjo3B4Zp6oLTN91UJIhuv/idawV
         Imvn4C5wdzzT3KMJ95JZ9QUMZtO8L+I3tLvxLg0UVNv6iU9d0VxJFXhk5YCJ1bJJo55A
         nvE7U8lqryWwD+kDxwLEJYf6H3OiufM43HqeIwM8mSYtSOo2YbRHGgEq75mxmGFfFsik
         OvDJImYQSRXrTgKChPRY0efa33FVPn+QHgFjCV/eNpvgEKrSKdXY+z+5e5l3/KNxznQ9
         5LdQ==
X-Forwarded-Encrypted: i=1; AL+hErEHIO1v6ww4uEU5LIG6EZJ/Qe5peB3N5/+9PxTGpBrgj+jDV+prrHXTGOJbyLpvf7QQhLe1XWz48FSHaHqm@lists.infradead.org
X-Gm-Message-State: APuU4Z9CkZrAmkxhjzsPUKMPLPAGzZN9+pgvTpsOBvpXxT3jblNNqIx1
	uAvH6Mzs90PVw0L3mZGVsurclWsA98k0LH90GVJGjolwrh5aGFa6dxEP
X-Gm-Gg: AZFdTZdCujUglQU5J0ZIg/2ayZ0MK0uIasGJR0J1jdMYXSJRjdDLgzIgjkvpcriKgqa
	1x355KHPjBrcuSenVshkjhOS1tlw1KAM5XuIHAS8G5N8w9BgptUAJpgzNSorWKW4f/Je/W3wQnV
	2R/+qg7vEESsXpaeaeaeMfxJd9s8JuDwK0i3mQ6Dl/LtvEcHXmWGrPpSU2V0SD/KVwU+naVEgfE
	NMx4i/45yrEiBMQ94qxKPXbOB9HGo1p7vHnzmincjXRMkKtGmLkW8EBEDMWA6QdERKhMEKq4DQn
	U0y/7Dt3VsS9GGexEhL3o9q2KADfLeEJtVolKKDY61zqrRaFv7BkJQT2kCpQPuPE9TTLqIBM89Y
	qsw6uX3wNfheaf0YX5naZ0NpRxl00ChsBAIhaLEt/He0Gghhw1hfOpn/kcrMe5ZApxwsFMvzdiC
	LBVyzSjg32nbUpfe9Oc43wt02J6EPMVsJWcNegL06wd9XpBuhHhdfeQHDnPAqBAu5YPLf/qiqX/
	L7u3u7Y8QiKKpPyBBC4TxJ9Eu59+BBt6UPqzBD1yox4gtNUQ+ylORnnmNuHFP3cK4siPCj9i79I
	gF216z94EBc9t6cUnJPxtBcyoiQJIhD0LpYiOFxJOydunMIye3i88q9rBSsBt47lHrQ=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr454205435e9.17.1795721618450;
        Thu, 26 Nov 2026 11:33:38 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:37 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 23/25] arm64: dts: amlogic: s4: add crypto node
Date: Thu, 26 Nov 2026 20:32:39 +0100
Message-ID: <20261126193241.1471372-24-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_193340_988228_426DB8CE 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration for Amlogic S4-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..de173f40e15e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -71,6 +71,12 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <166000000>;
+	};
+
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -621,6 +627,13 @@ mux {
 
 			};
 
+			crypto: crypto@440400 {
+				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
+				reg = <0x0 0x440400 0x0 0x48>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+			};
+
 			gpio_intc: interrupt-controller@4080 {
 				compatible = "amlogic,meson-s4-gpio-intc",
 					     "amlogic,meson-gpio-intc";
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
