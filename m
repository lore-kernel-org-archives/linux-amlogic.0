Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B31C432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF272075C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M8srk2JL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNVABK6F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAF272075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trAN5mrvVeXeOExd/56j28z12BMmZu2pAkW++Ese2hU=; b=M8srk2JLrgLGav
	zMDtUZ19/ZtRmyFwmhB/EC3fSPBEXa2tmY8uvGI3VpIEqc2VkZAwENbFsjXQFpebVQ22wIFFyXPog
	sPJtkqS1/3ZV8EaCRBoOTL1AmuM9GmVScCL5VoyTq34RFEjek+Npp9ptqDHmKzU35B5tblheLBi8n
	UbXaLAKKCzpm6n5LNSavY74crbUFgJ2KJ/5bzyLTRsnHUNYxq+HUKlRsHBKfjtvofCpBGxxVLQUhD
	KIYNlnR3eSB5SwykSP9SF8jEEPyNR06gnBTVOnPFKUKRlxdJsy0VyjaeLy/+q6t0wnVNk3juklAry
	HJDvjx4rag9wqu6FVQYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib8oN-00082C-I0; Sat, 30 Nov 2019 19:53:47 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib8oK-0007yK-0A
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 19:53:45 +0000
Received: by mail-wm1-x342.google.com with SMTP id g206so17403062wme.1
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 11:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ii35c65KXcn3GJN80PDQRJl0sMOUpjAJggVQtBzwMf0=;
 b=YNVABK6FsWRk70BdNBi0u27t48fPAQ6/1oKYpNXvNLDAcXgLgb3HG4NnyEKy+8K4Jk
 D6sXZYj8Jy2d92a9Ba2Jp+L4hfCaCarF5xh2lTjC3J/byTVEJLUdR8D4ZMHxabtVhE9w
 UdxcaW1XVFxxW8Sl+GmuT/LNhYNSdQCjW4WweTrQiCK0+ID/XHZ4u/oFa1SukNeNDEUv
 PsqtHMDUzLbQsnxiyB8dfjMKpZ+u6/tv9FnRKDQG/O5VaGH4XOUIvlVgWFlsBEXfG+UX
 NfOBc8JZDafXxvO+3SUxzlySKuA47smuiB7M+g3T+gQMLu78LraW8mvuPb9dQajZwhmU
 EVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ii35c65KXcn3GJN80PDQRJl0sMOUpjAJggVQtBzwMf0=;
 b=YDu5W7No85kgfTUGNQuTbT/V0S4UAP8nNlmBGSIhaCPVIX+j08oiHIj/E/TDIjtJGA
 2cPhI6RP7SGqz7Cy752gmxvq0CaIzbuqQh3gWXuKBF892IxYGWmKc3AK85cGG0JAYXiZ
 6R4AOHdz1bzbv+iXvhbtjcii71E6QAyCc7rYiCFDFfupn0E6tgGBmxh/iF47PnTjxvBo
 ysxnWa8I+GmHR1Ekg5BnZR/HBmx9ht/Kg46QC5DhkSG5tqJ+vK/qj4l4Wr8uSd45xgNR
 dkE9uYiVJLVvLQKTpjTPPR7paCpKnMqZuVS95/Etv+clTb3DuenMD7Tmk6k7NjZh/5jZ
 bEpA==
X-Gm-Message-State: APjAAAWAfujDvpzN7YzlpI+yJo1pqXg57P3sNCWrBVpsCg9eIwAWvLSm
 6/PfkoG+lgqkrtZbX0Z25r4=
X-Google-Smtp-Source: APXvYqyfElq45HGBQeftchZbmpcoEOxT0fzX5YLCTxp3RHNeiTDx1qGS0zQ8YpWQPa1RysneZB98Mw==
X-Received: by 2002:a05:600c:285:: with SMTP id
 5mr2399791wmk.158.1575143622743; 
 Sat, 30 Nov 2019 11:53:42 -0800 (PST)
Received: from localhost ([37.238.188.27])
 by smtp.gmail.com with ESMTPSA id d14sm20134040wru.9.2019.11.30.11.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 11:53:42 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: amlogic: add Videostrong KII Pro
 bindings
Date: Sat, 30 Nov 2019 22:53:34 +0300
Message-Id: <20191130195335.17740-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_115344_041532_19FB6877 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the compatible for the Amlogic gxbb(s905) based kii pro

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 99015cef8bb1..8c97b8867e2f 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -59,6 +59,7 @@ properties:
               - friendlyarm,nanopi-k2
               - hardkernel,odroid-c2
               - nexbox,a95x
+              - videostrong,kii-pro
               - wetek,hub
               - wetek,play2
           - const: amlogic,meson-gxbb
--
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
