Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF93C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7B0206D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lFVme6rH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAHG98Va"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB7B0206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JEySKvXvt9sqG5e0lvc8u28mjIO3tfXW+5gLLTtGnPI=; b=lFVme6rHKCF9qXP3LdS3GZH/XU
	Ou40GvI0X9cGsd6Kw13AY8SatJepyHx2VefzeKUxCQmr1Yd7rh2w5VBajBItdsgJXQGtA3S07UcKV
	8oye/BqQx88FDgmujZcR3AHYSDwubCQvP+EFN4mTyw9ZQ48G8Y4dGdSMkk9JHYxsw4mp6ocQaEen/
	zy2+Nwsh4A+FKmm9kT+/Bjqis1yKiKRNDzPv5hwqjCMCIYzA+MmH3KOfqnWJzW9o6G+XZek5ZZcWD
	sk/AEVEjFKwbLpaPeQymsmMe5u/hGH10gbBTf9bgWQtaop+XrTIUTZYP+fKrH7pjsvDDX3ZBbixaZ
	tWbb4Kng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaVU0-0002y0-U9; Mon, 18 May 2020 02:26:24 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaVTM-0002Ce-6J; Mon, 18 May 2020 02:25:45 +0000
Received: by mail-lf1-x144.google.com with SMTP id z22so6665421lfd.0;
 Sun, 17 May 2020 19:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EZcwl+FdQQdIuROk/dCH6r22SPirYIaGMlA5OOst7lo=;
 b=iAHG98VaJgzyHr4TazcEbw/DTb4yVWv29sNpFRnPZHWerKfGq82Qz7+cnjA1q0o7ns
 xWMp04x7z+e1dzKS/atiBfEAagelFJREYtIp+Qe4our3RrCWPI3LHk4X+BXRGVbLUZiQ
 8e6/luO3w9QehGASre10BZvnKVBJZ/IWiY4e108V73EP7FZeEZj4hWtKit1zzTV7aauc
 U2exa0G0acHjHhL1Tzp1hvxOhaPXgktqkFsAw4mfQ4LxbPzqi6lPITYTxboAeH/iII1l
 deUaui/u/yaZZI2Ar3v12mRjDxi8CKMeJsKYR3rUEt7RJJvBKGUI4WM/wVg1o4pVVvdc
 I6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EZcwl+FdQQdIuROk/dCH6r22SPirYIaGMlA5OOst7lo=;
 b=m/ZM2FqntxmVwPJE1c8bctobrHKuIj2KCqJXzV3XgNBep1Lbe5wgqOtY0Rmh7Nisss
 wcCclgUMmXhVxDKVgVntG4mo6TFasefVKpneUKS8/wnAqYBkRnIOrn4LAyY6VzgINGKs
 UFhX2NmOioWqsl1ILGE2wODOm+Vl+TdyVtyW/Wh2o3sgJSRNNi8wRfiUov68HynbBAZg
 X0EmQkzzKIirh7i19WEZzib5ScvkAof5Eo9ScawIMkbSn7ipu14QFl1EDHzpnDgVHuPU
 ZJLJV0mtwBAqqo2ozn76LNN18v0CeEVSLzl5yg51z7TeG2zNVK5SNqhFcgcjaQKWTHaa
 ZSrg==
X-Gm-Message-State: AOAM531adjabDP0rjjrQJIqLMcq7j30fAN7gN6P4NxkgHeepJ7vivLwM
 RRMOh5HPHhmmY4LhBDEKu3wMLWm+
X-Google-Smtp-Source: ABdhPJw+LU+/IwFw9MKHSFiOcLRwo+BVGtENw7Ju5BSQXs5NlQRrp4bjWvb2d2sG1i15BI8bqOb9Hw==
X-Received: by 2002:a05:6512:62:: with SMTP id
 i2mr1031616lfo.152.1589768742405; 
 Sun, 17 May 2020 19:25:42 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m13sm5997306lfk.12.2020.05.17.19.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 19:25:41 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: arm: amlogic: add support for the Beelink
 GT-King
Date: Mon, 18 May 2020 02:25:28 +0000
Message-Id: <20200518022531.14739-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518022531.14739-1-christianshewitt@gmail.com>
References: <20200518022531.14739-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_192544_231614_E3E9183D 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Shenzen AZW (Beelink) GT-King is based on the Amlogic W400 reference
board with an S922X chip.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 5180a548bd94..25e118b8a97b 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -151,6 +151,7 @@ properties:
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:
+              - azw,gtking
               - hardkernel,odroid-n2
               - khadas,vim3
               - ugoos,am6
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
