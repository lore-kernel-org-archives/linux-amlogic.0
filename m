Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E6DC433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:01:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2D1610A0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2D1610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dEV6oonHjicA1QAfvr3Cv2kBHhEhwP96voMomzs6La0=; b=Tq1/EMQzeDJsNKsMb+vUK+rQM
	Jgx2CHy034M1xc9XCX8QwaYTsSe7MnSfegbiufsiQ8qVYiPbnFlcrZX+jGQfSb3QidiNiLlyEv0hJ
	GOwB09T555EEdv5NhJR/hTDRHjb1tSHt/35jCF9Ux5VmdnYsdHdLoYScNcmwcps+1YVTHRPoVZny6
	MDJt4Ce05lv0eLUnYFsEc3VYXv4QUzX8NbNIuAExFIHijQyt1+ZiPwaWJyTbkwzxGzS+2cBK9Y0mA
	SCTCbtfKw9aBLPFmdUsZBcf1zpZf8hkkji20RYnvR3TQy41t6JzL7gt8J+41zKRc9mS8z+kuRl4hb
	q0iQVgMew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda4s-00E9kA-88; Mon, 03 May 2021 15:01:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda2l-00E9Af-7k; Mon, 03 May 2021 14:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GXN6lwbGsWsgi+duQg1bgSlBiOoKXOf+TIMtVpvr234=; b=m2bBMtFfHSse7IqpcRRjN0+Wyp
 9iO0z+58w7FpqsMxbByTqOtEuItmzWBJLlMOJ9zGsO9Ncmqi8BnAoknmkJMJZp3ccbhNqejnDcAC8
 1ICSv6a1hQ+PzcZNAEf5NAeWS08ogkgHtkQkX08ZR+gsHXK566K6v8zpTVLvzlbMPs0S4x0TScnmq
 24WoYy5/GamWKTmqEY0fvzm/XnVL2QU6E0172GCCgMYWRWV8tLgf2LmjqObwHLqE8vdTVLq59nO8O
 TOXU0Yijz8fzGUlSzCveb01AYAOpzMLe929dXJK4UVxbQPit7LU5XaVVNkev+zjezQbmFQgNmkJH3
 AZuCJedA==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda2i-0039Kc-IO; Mon, 03 May 2021 14:59:30 +0000
Received: by mail-pg1-x52d.google.com with SMTP id s22so3813528pgk.6;
 Mon, 03 May 2021 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXN6lwbGsWsgi+duQg1bgSlBiOoKXOf+TIMtVpvr234=;
 b=KS3qHNvfG/cWG8uFRIxuiHEWIeE7kALsIqz4peGUHvFBuO+5wahFZSSOUEY6ZOn9Oo
 o40pws3KfivqBbk9Q/RiQfxxqX4INWGyauv8/zWEyo0MVVmhNcOqGsN6bbHvSPyLxXq0
 VTyhRHYP0hjwt5n32DqK7eNFR4qqVl7sNrj8OL/c7P1b5GNTMjnkYkl9Z3zlzsUXkS6j
 Zd48PqKw9ddtCfD4MuYMV6Ly3gN1kRhxqb+8csb2/lAAYM9ihQ+jnLR/ET3itk9C22CX
 2KNIKN4ggQKdSuiEfnsyWE5tMJqGJ6Dm9dxqhswTunPX38HRmGhE/WXDnwPz8X2z95d2
 25hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXN6lwbGsWsgi+duQg1bgSlBiOoKXOf+TIMtVpvr234=;
 b=Jp1RkJSmOnyXUghmUgS7sglxy9qsiLh7+oZUJQoGrxhAgtptGHNKWf1JZm1/0gEOiJ
 6IlCu2wok2MOiBqg/L5iMOpD6ABo8V8FppbPWgXrD/ALkTM6gIX8S9jeoZhXuhYk3vpg
 3mEkcr3irlx6VTC/sudD9MDhXbTTy7ruJt8SzYeXSEZBjKnZ/LEeZbzbXcsgDwaxyPCD
 BRA2KbDdUjhNKjMUN8rFjTJN38RhqYNAUTGAYTNHOqoPupyACbcMFXeS0qJNm39Hf0mY
 mp7GSogcviUovaCiddpcVU8wvyvj3NNdho/TmGdyCO8/R+RhWw/3r40LnxxIlCm9HmeG
 7Udg==
X-Gm-Message-State: AOAM532zP1EniFKbLqFxC0odV8yJ83F+qkvWGEzLLiDiUFexIMxcms07
 zt4wt24LdFy71gtRAfoF9RY=
X-Google-Smtp-Source: ABdhPJwZ4qfpVTQbY6D9dayHKNh07G1hp3UyhjWAsOmTskW9/coCHxrWS/68gTBlAdIoTYbvGTIlqw==
X-Received: by 2002:a05:6a00:78e:b029:28e:62a4:5f3 with SMTP id
 g14-20020a056a00078eb029028e62a405f3mr10642223pfu.19.1620053967572; 
 Mon, 03 May 2021 07:59:27 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.07.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 07:59:27 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 5/9] soc: amlogic: meson-ee-pwrc: Add hdmi power domain
 Meson sm1 SoCs
Date: Mon,  3 May 2021 14:54:38 +0000
Message-Id: <20210503145503.1477-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075928_623951_DE1C6548 
X-CRM114-Status: GOOD (  11.58  )
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

As per the S905X3 datasheet add hdmi power domain
controller for Meson sm1 SoCs.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c         | 1 +
 include/dt-bindings/power/meson-sm1-power.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index ec402c4ab931..062b2488f932 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -302,6 +302,7 @@ static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
 				    pwrc_ee_get_power),
 	[PWRC_SM1_GE2D_ID] = TOP_PD("GE2D", &sm1_pwrc_ge2d, sm1_pwrc_mem_ge2d,
 				    pwrc_ee_get_power),
+	[PWRC_SM1_HDMI_ID] = MEM_PD("HDMI", meson_pwrc_mem_hdmi),
 	[PWRC_SM1_AUDIO_ID] = MEM_PD("AUDIO", sm1_pwrc_mem_audio),
 	[PWRC_SM1_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
diff --git a/include/dt-bindings/power/meson-sm1-power.h b/include/dt-bindings/power/meson-sm1-power.h
index a020ab00c134..094a6a44ab96 100644
--- a/include/dt-bindings/power/meson-sm1-power.h
+++ b/include/dt-bindings/power/meson-sm1-power.h
@@ -14,5 +14,6 @@
 #define PWRC_SM1_GE2D_ID	4
 #define PWRC_SM1_AUDIO_ID	5
 #define PWRC_SM1_ETH_ID		6
+#define PWRC_SM1_HDMI_ID	7
 
 #endif
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
