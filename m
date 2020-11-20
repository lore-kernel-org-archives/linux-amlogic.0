Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837EAC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:32:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 729B122D0A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AE7+JJqj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mqJFFuhS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 729B122D0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Em2SNtuqc5yx6noQkQAwAWEDpM+ZwRjtxfaz6/v3xU=; b=AE7+JJqjnAcc/Ce4QIbEgxPrcg
	MTr87MqdXMn0cDP+bUdoyr2O01ZQUV+YkP0/8l21a0YwDsmd7AALylHgghV6S9Gm1FifthwiGP4rJ
	rXgz/g2h0vXwZ0L6CtzOevuJaoeWYyvs0TvO9HeEKOlUZwywRhJeiGuCutQOb5YBJFZCUhM9EGgKz
	CSdK1UqDQvHbLYzZ1SoyExty0Kd2VYaakU+TrYr5MQlFTPZNK9NZA+iLjJTwHBOss7u2HoSvubbPJ
	oFWtiAHQWJA0wanZG6d68WKcCw3zD6t+nlAVUGZ0WyvqJ/zKKlThHeZWxkedVFG+7C0M6dc5mYsSZ
	z1tVEOkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8Ox-0007i5-PK; Fri, 20 Nov 2020 15:32:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8On-0007de-Sr
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:32:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id c9so10726379wml.5
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sPtNFz54pGGMRSi9xtTjKB8mQ3p80G/kbgan9jWXNMI=;
 b=mqJFFuhS06h704ewqAtsJFpB7SF8d0uemfdgy0lN1W1Zwl22T/KykIYLLBCXxNUI9V
 Q4IaMjEAOZ5sWnXKFo8eSzZVgmnD/6LXl4Mf6tGZum33sHT+c76HtYiZYru31w2NhQj6
 A0Zh9vtT52wt2XGyn3hUx7y/VjfiKuVVBAy89EkaynS28Ssaw/aiu8NglmcDlMNZzJrb
 zpQWU+Sw5agM5oViilF4ipXJEW2ARDMy/p9Ri7UALP/EU0vtrdkSRjwgwVrhMyycrsDJ
 5oMnnC4Kb9KlZ3z9Wi5h6mXL6zde29MN750HLNUGa2JyvGpsupdte/ocVVHuvnV2ohtV
 A71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sPtNFz54pGGMRSi9xtTjKB8mQ3p80G/kbgan9jWXNMI=;
 b=L4EOTnWmjvrAafLL/AppO3KFMMk3LU/klAKvmsi6YT2KkjSiZsxbxPqm0SkRlkxA9L
 xoXCfQOoljzxKXoOsdw/BRDKcRlgpxc4+PdIhpdyGmEWUVGVkySQhMTca2mrhGdg+Kmf
 hy/KAGo1lICHoICIun0MG1eYGrAglQqfu6E+4PUSpeGqUSGMwekp28VTHHDsQOW3sjKa
 Jy5oH/DUc2RUOExe+rdK/GVdBEBiURcYM1dD7yYd/FcQIDagclNsABlNYQL/aA4+gA4d
 Kvv28yM9jAVx99KZ6T0pSBd5vNUNxMsiUc8W92DP9NDlMwvsrGqq2+Y7KEOCbW8OOWgh
 733Q==
X-Gm-Message-State: AOAM532rj64IQOl+LWVPABPlbynllZYh8kV6HF/RBqBMbWwPQYDAqWhh
 ZK81aDfsV3/8cf9IF0rUogV0sw==
X-Google-Smtp-Source: ABdhPJw07YcQpTr4Hs0NbjodcjQli7NoI0JLjS+1XtT978vtBof3DrAfdWYinxme1GuXaWy28XkVtw==
X-Received: by 2002:a1c:44d4:: with SMTP id r203mr10460587wma.60.1605886352773; 
 Fri, 20 Nov 2020 07:32:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id i16sm5398180wru.92.2020.11.20.07.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:32:31 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/4] arm64: dts: meson-axg-s400: add support for USB and PCIe
Date: Fri, 20 Nov 2020 16:32:25 +0100
Message-Id: <20201120153229.3920123-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_103233_939797_2B721BB0 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the USB and PCIe to AXG, and enables USB & the two M.2 PCIe ports on the S400 board.

Dependencies:
- Patch 1, 2, 4: None
- Patch 3: [1] arm64: dts: meson-axg-s400: add support for Power Controller & MIPI-DSI PHY

[1] https://lore.kernel.org/r/20201120152131.3918814-1-narmstrong@baylibre.com

Neil Armstrong (4):
  arm64: dts: meson-axg: add USB nodes
  arm64: dts: meson-axg-s400: enable USB OTG
  arm64: dts: meson-axg: add PCIe nodes
  arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots

 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  16 +++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 111 ++++++++++++++++++
 2 files changed, 127 insertions(+)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
