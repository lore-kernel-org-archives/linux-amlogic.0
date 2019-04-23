Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C5CC282E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 13:37:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A05821773
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 13:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WhhO/ecc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h/k0chIl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A05821773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plEnnNo3v0q3KDyQI6EaR6sH+qT3euKf2G2uHbR4ZFI=; b=WhhO/ecc3zOOrn
	u6gDK10RWmu+2T5LSwjTuIHtD2LxIcH6zOo8wZXnvwRFXvMqTHgUwdEoAJl5JlowioPwxSS9/G2Bv
	bTd/zvSoraJ43MQM/H3wutNA2b3okHylNhgwx1ojUASmfYJLx9zzZL92qbyTfcwZoxvUHso0yuYRH
	vCY8RsDVZ4l0494jSnGlqP1r9VvnpTp8ijNhfQbQtSiTD1QeSAvxL2X9cKFp0Q25nFAGXXCS/2a9M
	gexdcWAXTZUmJ0KyMBSc89bJTBx7ei5NP/WQ6Iic8+86XFg1u4Uf1hE0A2NFOdLxnO+iYv+GG6MoF
	PvlK6lO68nol2QNJKq8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIvbh-0004nM-Ob; Tue, 23 Apr 2019 13:37:09 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIvbS-0004V6-2I
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 13:36:56 +0000
Received: by mail-wm1-x341.google.com with SMTP id 4so107879wmf.1
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQSrVwDmr1HQ9kqxMmTwk0XWGEyd+c093hBjiuVx8bc=;
 b=h/k0chIlrjXZFfVJZKzNRU/7VBPvmFG9hAc5gMMfpvxauD7MWhes4IPd7aNUpCqiuX
 UIqiNilu0rFTR84vow/iSOghmYHt5pjC1batpLbDTxiCh4hFsdHpYsH4mVTwYcKbTe+J
 kK6eElSduZr0YbsGgNy28tqk7jb91hvIoV3CfySgdDZwD4LFeDTvEgu4tjJ4ffpedPFs
 Ln5tr4zyZy1mxjnFydoZDhSNr4ChimkWKvztgrrdCjLf5Y7yst0YTIWgRCNL+Usnngv8
 Pp4vaTnbr4EEAZ94zZkuTvohrOYg0ySFm+XlPqhENoxLrHdUuzVfaQMDxz+o47KtxxUT
 j0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQSrVwDmr1HQ9kqxMmTwk0XWGEyd+c093hBjiuVx8bc=;
 b=tdL29U1xWTEsxrQ79XJurKhJzzPA7w1SdUp24ZpY30pqo0hE9bUuRr3peWJlQZdmgk
 3vrTec7JB3n3cn7xVJhVQhV11fIet6Vwom0ZcUIEACcyH5XwT8bBueAoTHmaDE0eXXhM
 +TfNDFTVfToJg60rQU1VJEoXnmB1WMJsp111i3/wfhRlKUmshTaGvg2nab4a6EaHVsST
 GhyYOJUUe3zb2onovDYi5Vg/X+9aHnKTiSB+Sxlv1N11vs0XB2RGHsyoFDxVDnk8Py1c
 hIfIarCp9+qvhAPwB5/dhB9oubhZ2zCOR7nYu5ihJ49u01iK7RPILYj6jRf9mac/6/kW
 hlqw==
X-Gm-Message-State: APjAAAVxXXptMVJO3V5yaRUJ1QftXa347D5FyG3FZGA0gE3QhUiezWR3
 1JthxBANGX6jAixCPFjlYCLcGQ==
X-Google-Smtp-Source: APXvYqwXBniYbjKTahnNsFqXrgbfaflk3GyG8hY1CXhuQ0SZHSCMjNvpkF3z2GsuVULZicC6rUWdcg==
X-Received: by 2002:a7b:ca51:: with SMTP id m17mr2129980wml.25.1556026612681; 
 Tue, 23 Apr 2019 06:36:52 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z20sm13509543wmf.34.2019.04.23.06.36.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 06:36:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: pwm: Update bindings for the Meson G12A
 Family
Date: Tue, 23 Apr 2019 15:36:44 +0200
Message-Id: <20190423133646.5705-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423133646.5705-1-narmstrong@baylibre.com>
References: <20190423133646.5705-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_063654_104170_EC549BD8 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the doc to explicitly support Meson G12A Family.
The 2 first (A & B) AO PWM uses different clock source than the last 2
(C & D) AO PWM modules, thus we need to differentiate them.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/pwm-meson.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-meson.txt b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
index 1fa3f7182133..891632354065 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-meson.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
@@ -7,6 +7,9 @@ Required properties:
                          or "amlogic,meson-gxbb-ao-pwm"
                          or "amlogic,meson-axg-ee-pwm"
                          or "amlogic,meson-axg-ao-pwm"
+                         or "amlogic,meson-g12a-ee-pwm"
+                         or "amlogic,meson-g12a-ao-pwm-ab"
+                         or "amlogic,meson-g12a-ao-pwm-cd"
 - #pwm-cells: Should be 3. See pwm.txt in this directory for a description of
   the cells format.
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
