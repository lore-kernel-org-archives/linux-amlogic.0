Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C060A6F5B
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qGvrQITI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SetFFQFt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Asrppoii
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9sYsITgcQ2w1/S7hPcjT19fe/HzoVr9LvtQzQDzW4Es=; b=qGvrQITIX1KgoOzzcMhXnnY9bo
	bNNfooANxYzdfmnkE8+RAVHkHQVcJqKW0LHCC2TB/UthMf7GEthn9Y7Mp10nNZtGe09eolFTV08Sh
	gI9R3Wf+bpkEX0YhDhhgpmG/BVWWK3S7sgBKJST/Zi6mwbPysTWpriwbKh9250+zLkxNstn5KNloB
	IKFIlAOEhjpkk/m77IR8G2FQ7sJFqs879bLraIG1u1bFStEfY7WpyJtOH0NCltLoBx4v5gP31eZln
	LeB3YLbGOYT+JIYie0rGOdvadUzBbYsEEmTy6KNP306uS1+qdChwWnmp29vagZKpWHvQ8oQGArUtx
	sky34HUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZd-0000000Ei6s-0pTV;
	Thu, 22 Oct 2026 18:31:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZY-0000000EhxC-0q44
	for linux-amlogic@bombadil.infradead.org;
	Thu, 22 Oct 2026 18:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=; b=SetFFQFtQP14pAywZ/45EaAXMh
	6m2vyuPiOM1ZWqzOtJWZy84lTTj8zi9kXuRYk/aqAiZjRAkOQQFc/aV1oHRu37s9KjqVqViyo+XSz
	a628QI0Bg2q7e3UY5UK2lj1NRAX6ed7Nu3lQXi/xR8CThPj4CufTjP2PVd3pgJ0GveUg/IcNOklE1
	Btr71lxl8K9YR8WPfjRLTGxmAH+J0pAs+ArXoHuKBt/Lh2iyAF9dILIJ88A4k3H81HiLssSz2Lqk5
	FsYhSlKzUuXNUylCf20nhqlrjvSyayXX+fkLSpmU97QOlsu+gAJB1DEzAVrYpfPvjlSaTvS6XQZeN
	1ZM4RjRA==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZT-00000007jY9-1Ckq
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1093075e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693882; x=1793298682; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
        b=Asrppoiis9uQ3M0T0+ogOIKhe6GhrLrFzM+JHUN//NqoMQ7QMq/DJqQsqqpUPCLmi6
         Bwkni89Va1IQmJx5whQ2Q4dlnrisJfSGfA7zs9P+MHw2+WZkv8v6AJMD7ZaJtec1WT88
         BqN+++y3U8qUFEH5iRkEM5KZo9OmRxhhh3oUl/kG1M/x37sWU7i6MrWcMzPEReo8Y60v
         Jmg5xMPlIvYrplDBKpcLqAiDj5snZ2dLKp8CH8oIcoN++1UJrt+bZJTb8+iEqszZZF03
         13TIozKTinxFh82jxUSGtftZ2lUe1gLG446XNV4h30Ic6Kn7PlD+AwF4HyjTkirBz9Nl
         bb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693882; x=1793298682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
        b=LIhPBIHKsgiuduJdKs2xxef8gXg+pX7kCUEJgIhVTX7aHTqBNVUL+K6eIgTu3ruJlv
         O59Jj8OEhAA4PoA0gimghh2uM/XIOpdBzj5EtPNu5DNUyx76VPYnmJ8E/yE5wPXKZuXg
         v+JECGu8yZZk8UBBN/N4UtjZGk8bNWbPHuqvt96knd9/M+aU1WSp5ceL1Gyu5ca5mqsB
         e63Zov9LqSfO0FtsIeYDYSPXeOqdbrL/5LluLx3q88Qcyx6H+MzY86rbKwP8DX2EcXw8
         7AI9YTBhqnC891UsaNpYT2Wzyo9wcqdrVMVyx+zygKxh/Wmufl8nwtEQRUSNkJ9qh5DJ
         fm8A==
X-Forwarded-Encrypted: i=1; AKwUvBy/QtjHHRyn57kGQRmeVsCh2TTPYJJWbIJGUuX1nxeRNueLkOXj4Pc4sncu8qFf8X/p2bpf/xgpGyEZYTFr@lists.infradead.org
X-Gm-Message-State: AFq9FYJjSWx2owTFLYXMH6kfsWHY0DAK6wYt/ZWKUOkD5tpuv2i8S44n
	sWiHLE6G/YbCzC8+f5zzHooFCjQak/ZQWwB+WWNZHEUf0iBabBWJ/wxslkDo6Sdv7eA=
X-Gm-Gg: AYBFou32LAftZ6IkDO4XjhSKUV6ECX/BdlK4lMs8vEFFZC5eD7+1YKFOBxT1+sCwe1j
	xzT8whNniVOpMjymCDj/xePDwuUvqXwDdKRlBTILQicv8Zb32JA8+ims47zDFjsGacN3gVQO+Oi
	kfB0lUjo+309rvEfV8H2xfZ3C2XOFs0wNuRB4rgp8lxFelb5eYtARpoqbNvXePfaDYsUWjh8rEl
	9+J4A5pDRoRAP5Ploiv8abwcb0wNm6eEAd69Ck6tJI2SulWiVv9wM5Dr1G8VKPbMJxeF2VzV16E
	SLUKRrMWHwc+nEXKu7dZDpmi2rX4SKpXmwqbUlHJzugj0zKYI88wNZY5MKR98uImVBzdXEQYQM/
	pQ7/ubWBuYXbUZVCBM0izdngntGevBXbBgpYtzD/XgMdjcRhTBdL6xvzmp/lEDGmUeXfwqgfVDN
	2UjaoAbseKaUtOuKY8Ih2HZ4WRBTYI7BsYcdjNZWvgQlWHZPrPqYZgWCnh0+NSz/tF6cVQvDM5v
	6xYzRGdVSA5XvfBixh/7QLC3+wH/Jq5nQj9AR/MNQ+CgbpmOHkWueCkssW6ThbS1wqpYmb535IW
	v/tKdlVYTuOidepQ6ENxv3BcYcoxC02DYgIM+IIvMA==
X-Received: by 2002:a05:600c:540f:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4a1fd8cde00mr114350305e9.4.1792693881668;
        Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:30 +0200
Subject: [PATCH 4/4] arm64: dts: amlogic: s7d: describe the GIC
 virtualization regions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-4-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_193123_560003_E66A5406 
X-CRM114-Status: GOOD (  11.66  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7D device tree describes the distributor and the CPU interface of
the GIC-400, but not its virtual interface control (GICH) and virtual
CPU interface (GICV) regions. Without them the GIC driver does not hand
the GIC over to KVM, which then runs without the in-kernel vGIC.

Describe both regions at their GIC-400 offsets, as S4 does for its
GIC-400 at the same address.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 059a1bf37584..b77ac8898d16 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -85,7 +85,9 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x2000>;
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
