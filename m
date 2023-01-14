Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3569C46467
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Jan 2023 23:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6ONAiR65gLaATUfFP3zNkfg2JOWDeR/eAk+MfBK6nQ=; b=3EMb2TAxvBSFrO
	1YlJIw2KIoAk3hozZWj4EB6qy5u7FpHJAOSQOVmqhzJTy3x9Au4mtWeW82nhJAxnJRfbGn05SHHux
	YkEkqEb5uKzDnp5+3r5Fonn+q8Lssx2kazQ5mDT7gpgtL0BeTgIY6Sih1vOtVTF6TZhXGRheY+jwF
	5BO8IAHy2HQ3QsfJ+gQdsA+ZVAp1gxHBfA9O9FyS+dP+2k4roHAcFfhd97znZmfXnOaca0vs57W/b
	vo+JUXcegx9TLRF53WIkWyxfKbhJIgOMmgg/kZpBYQH2P8jRwGV1J3QwUUn5uulaR9bpE/rgPgTXf
	VSacZTRIH79Ks22NtB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGq3L-006dYC-EH; Sat, 14 Jan 2023 23:35:11 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGq3I-006dWu-K1; Sat, 14 Jan 2023 23:35:09 +0000
Received: by mail-ed1-x52a.google.com with SMTP id v10so34875054edi.8;
        Sat, 14 Jan 2023 15:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cotKAnGSNZR0YjZladix62jgHe5lpxQaAFYHqTe708=;
        b=miszWXtcuJ9nwlWcBSR6eUN++o6TN2IEYVGNjKGUWW7U/vkco4/E7qAAZJV4gui0LJ
         RCG+s2EaElkr5cLHuw2acuAg7TcZTdsNVUsDTVuJq7QlH+BU1EftXJiWku2fIyoAHJdx
         4iNI7kdRrLAe0PIJw+YvPX5KUECJ2/VFX++/fVUMaXMQ7L8xNFLYyNjwM1n8sWx9FdzQ
         1IIpstVtSySd37cCXjsb7VGui+lGDblP9QmGrpNO5GVzDfbEhYUE8YrY2rX0tHAduJtg
         g1VXRpso7v/oIHp2BbaYx8WqK5oMkVDAdNbtRHUNwfjm1E7wVOkWlYgnk5rK/bIDXNdX
         Fd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cotKAnGSNZR0YjZladix62jgHe5lpxQaAFYHqTe708=;
        b=xZDEPN1FBO3m31VyNKDRjUoyhC64fg4zCZ8rk6xsry65iW/pSoJZ5NKoi1tkz9ldOL
         S+ySb2CT4FXtG2Cd+Xb7MRcduna9uxM6WLqWoGWuetRejGuOE6i5fKcnk0eYiskVkIID
         rOxCZM/1mXIVGc9vRxUQZPNrjwmSWR49lRQAH+wuM8VVO2YsCkS+Jn69hEaHK9G/7S99
         v3hQrFykz9u7F/sWsZti8NMkuB7mVStb+4mik7cPdTRWSOpUXf2otlfOOhkQ7D8fxdEP
         5xFsh3Y764d+nqQdnRN8SknCjzj8exK6OS5zwAEMoRLyQZdllXd//1WyTfVP3huYt3B6
         bnbA==
X-Gm-Message-State: AFqh2kpNamtqWuVMX7Ltvg4T/jksjjhFzkcxjq3vBUhfpbG8tN50lrvg
	ROJR74BrtX+nxwmt+PjIS5TmjQKQ1Wk=
X-Google-Smtp-Source: AMrXdXvjzrQIUaW9aQ28BVLrEo7vqBPKaOk9o0w8kM1k7NSj1rkSEEloX49EAX9JaTySf29E4nUQUQ==
X-Received: by 2002:aa7:cd18:0:b0:49d:f700:b225 with SMTP id b24-20020aa7cd18000000b0049df700b225mr2417077edw.28.1673739305032;
        Sat, 14 Jan 2023 15:35:05 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7ae1-c100-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7ae1:c100::e63])
        by smtp.googlemail.com with ESMTPSA id d7-20020a50fb07000000b0049cbd334b13sm1967620edq.29.2023.01.14.15.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 15:35:04 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	neil.armstrong@linaro.org,
	devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/2] ARM: dts: meson8: Add more L2 (PL310) cache properties
Date: Sun, 15 Jan 2023 00:34:54 +0100
Message-Id: <20230114233455.2005047-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114233455.2005047-1-martin.blumenstingl@googlemail.com>
References: <20230114233455.2005047-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_153508_692502_0E8BDF1C 
X-CRM114-Status: GOOD (  10.55  )
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

Add more L2 cache properties which are used by the 3.10 vendor kernel
but have not made it upstream yet.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 0f8bac8bac8b..a86f6afb8f87 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -651,6 +651,9 @@ &L2 {
 	arm,filter-ranges = <0x100000 0xc0000000>;
 	prefetch-data = <1>;
 	prefetch-instr = <1>;
+	arm,prefetch-offset = <7>;
+	arm,double-linefill = <1>;
+	arm,prefetch-drop = <1>;
 	arm,shared-override;
 };
 
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
