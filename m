Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABA1C7619A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 05:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v4bYPctQr6JgNgIXDOYGTG2MgeyMcWu+2/UxBkQwD/U=; b=m0GdqEa8peasKT
	bQjbVRf9XB8VvK79G75husH9YKLUgAIRrzSh2BJrKFO9u99GdlPI0CtQ1npg9tmj0hRDCBi2jsAtJ
	VyJpFDd4lLyMQwl9WCk8RcDVxx/qpD7WeldMQSlLLUeQN0+RwrUow5PtNEzD3klC1U5Y9SCf/UPGW
	zEqkA6oV++nu7iT932eJeCuLqkfqMxabz77S3TgEnYCSQvkZi+gZiMyYjIEkbm5icK4vGG/HUsrS4
	l3CxfE8J6FnZs1Oz7xQPGQSUtH9h/9mSnvEXVNxsNJ+dU2f8BcppYBijaAKy7kDDXsH3/Lprjc9rU
	9rFrxpsxG29KvmL43Y2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm6eD-00GT1D-2A;
	Tue, 11 Apr 2023 05:34:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm6e9-00GT0L-2m;
	Tue, 11 Apr 2023 05:34:27 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d9so6354133wrb.11;
        Mon, 10 Apr 2023 22:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681191263; x=1683783263;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxQ46jzEdPowu1sW0dqP37HDXhAXduI2aAPLIfJFVCM=;
        b=SsftqwyynLZKM1seZzIV5+Uan84LrZOZmacd+BU1uiiOsImQgIux8Z4ypZYxUNCAh4
         NWwDt1DUbEa7k/63DvehaadN8uhwR8b7faXUGq232GPZPzJ/aXfuiNxQJA33TtRed9TP
         Oxibd9uEOJwKj2pm15UkTEOSC1tQ6Ssz+843ALXQkwFC/6H/hjmnVi02RmiW7Cn5M2/y
         jCe9efcumCn5Fg7T7usHGj2OCsccBcDkbXeIgAclxeAHwsRhQJm9ajHavhxIrUscZqaY
         U1vXHbnYiSo8u+95hH+lM0E3Ehh3MoRRE1pWMu6BXfPeOemUJf3RPX1zTdkbuPUxXr9H
         zmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681191263; x=1683783263;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kxQ46jzEdPowu1sW0dqP37HDXhAXduI2aAPLIfJFVCM=;
        b=aU5sraXfEk9CqpDwi/2gk5Vcs2AZ3svOWd0xgThga7rbV57ih79tRm/x5lt2MQSDO0
         06BXf0QiHCTZ+PxpoiNqmt7PkXwCNfFMRc4qcElqWrh/t1pJUwMW7qvjDamxe9814G2k
         ix8SpJbPBYJEMrchXSXib2acXMjnYOrmTJTojEINxLA6sOdr/pVwCgcwRwH7+XVxUBsJ
         djgU5hy3isdK7/67je3yo94Y8pajMaJGPm8DWUdHrxX8HM5SUGV9XM1JigWiTIsDOWfI
         FwkUqKPp/SbFm4o8jAchDWDU+N98b2ZRmY4vXL/Obxq2VUx7SZn9su1nKQdI5jeSahPM
         x5PA==
X-Gm-Message-State: AAQBX9c0YEs7GoQif+O+fLpr1l/THmHoT1oZkBl5D//SeQqhWqxpmXVI
	vm/b4OHTtx97U5a0gUXC5LU=
X-Google-Smtp-Source: AKy350YoZWOjcqGBvUIV6u024td8TbY5wv1bKS3oQHDEk8qVLXhvE/KNKtssWUyxigBMQX8NALgD5g==
X-Received: by 2002:adf:dc92:0:b0:2ca:2794:87e8 with SMTP id r18-20020adfdc92000000b002ca279487e8mr8037932wrj.21.1681191263476;
        Mon, 10 Apr 2023 22:34:23 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c4bb:c200:491f:994c:df34:b485? (dynamic-2a01-0c23-c4bb-c200-491f-994c-df34-b485.c23.pool.telefonica.de. [2a01:c23:c4bb:c200:491f:994c:df34:b485])
        by smtp.googlemail.com with ESMTPSA id h16-20020a5d5490000000b002c8476dde7asm13471923wrv.114.2023.04.10.22.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 22:34:22 -0700 (PDT)
Message-ID: <b53af028-28df-105a-eb50-21a1ed4e15b5@gmail.com>
Date: Tue, 11 Apr 2023 07:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] pwm: meson: fix g12a ao clk81 name
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_223425_898415_2F72B2B9 
X-CRM114-Status: UNSURE (   9.66  )
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

Fix the name of the aoclk81 clock. Apparently name aoclk81 as used by
the vendor driver was changed when mainlining the g12a clock driver.

Fixes: f41efceb46e6 ("pwm: meson: Add clock source configuration for Meson G12A")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/pwm/pwm-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 0fe0400c2..429f6ef4c 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -390,7 +390,7 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
 };
 
 static const char * const pwm_g12a_ao_ab_parent_names[] = {
-	"xtal", "aoclk81", "fclk_div4", "fclk_div5"
+	"xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5"
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
@@ -399,7 +399,7 @@ static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
 };
 
 static const char * const pwm_g12a_ao_cd_parent_names[] = {
-	"xtal", "aoclk81",
+	"xtal", "g12a_ao_clk81",
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
