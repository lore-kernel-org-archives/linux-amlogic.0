Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7372C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC7B213F2
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tw+eM3bp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hhhy5vF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AC7B213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dmg1xWID7d5T4xcK+YKmN9tPQPRaSm73Rn/Q6L+efHc=; b=Tw+eM3bp/QLytv
	6X5FKNjzhnQT74GfWRKJinwwAMm5Ysk+zH+E+D5seHVeyWrW/EVyXJRHJWE6mMBYTt/ZYNicViBHV
	FF8copOPgbn+AWqLYXTz8pMCH9oMWQ/lUCmZlK7hW0gQ4TbFYUDfSwQhYLfGQlVfY5EfFs98FQ+Fd
	4pAG3+guUvEsrvu967HGp6YhVmH85JM5BTgqVBbWrmHoXhRFLn4DQY0VdwkZU+J8iOQD4sfl0OzQU
	LnniUheYTSPYn7mKvdxDDrzIjCfuLXC7wx6huXqLXu2SJcUlStLNnDJ6rF3Hqun4sc8kyqEVxfTtv
	25mz0fgjwXSRyy/2fLNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6MUa-0005CT-EO; Tue, 19 Mar 2019 21:41:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6MUY-0005Bo-6l; Tue, 19 Mar 2019 21:41:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id p1so482487wrs.8;
 Tue, 19 Mar 2019 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rp0ONdgHeRnzpFSUPYt3Ohcl4LuEe8qUiPz/+1UdoOc=;
 b=hhhy5vF1y7t1KAW8tuGlfu0QWydwVNMERKGAk+Q8zKAHG/O03hNJErkzTI+laXSPi0
 xvMPp8QzBowkDFY7Y5Xpy/mNNqlOHHbztdPIqZK6VRibfRM1tGTOLK+uErbF7LKeEfF8
 dLqTBzpOM2v0sstGmNv/ZhLBHTm0lvWnsuhXEkNOkAWEE8f042JfxVyz5FWcXHJin1tt
 CoUu+fc1Lpv9GcmUOyP8drhQ+cbOy5lLD1n63VEl0zEDDyTVech5ha/jvHYTmcZRToe5
 hAh5ImLYEUZIRwJUd2UJX6kbQXbvfLMfySq8nmEIsbMNpA/G1JIA8n2qB6r4mTh9Y1z6
 h97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rp0ONdgHeRnzpFSUPYt3Ohcl4LuEe8qUiPz/+1UdoOc=;
 b=uO6H1NlL7V+dN623TiWTK723Eg+c99UDUhuB3nOB8bj3uQhoTGIPIkt1nAnbgvFTg9
 xE5GIBvRorEHnj/L6z9O00xtTcGgga7rtTu/hiCw6nbjUwQCaHeYqeObT5VtKZVc/6uJ
 ys3rryqUMe5/AnS7RK3UNb3J9kzaDiqhf9p2J8TGcTCUPdfl+yKl3rRtk8Z4d5CRY3EQ
 EEeBMch9R/Y6I+8+y7c/dncX1XcmR+iSttlp7bWJ2xvXcInPWMsRHOEgckqr7asgU4EI
 wz+UX3LCGORJTyq21639LSGRlP3PeUKirkxl/UolR9B4nQ4xwDNguQVunvFNpz9GwdAv
 dzAA==
X-Gm-Message-State: APjAAAXvxgJ7oA9hLpnbzuylkGBKSd52puwWR4dX3+C6ZNjotAn5mdsU
 DtR7K+8RVZsBjeoiYmdC/Z0=
X-Google-Smtp-Source: APXvYqy7w59zKCu+MyZEXXwI/CeImhYahd0GJ4pkt+2lewVJnrKRcF7r8k3rYWPGotQIXbBuoigNEA==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr7405823wrs.278.1553031708065; 
 Tue, 19 Mar 2019 14:41:48 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:39ee:7385:1514:9d3e])
 by smtp.googlemail.com with ESMTPSA id n19sm139675wmk.35.2019.03.19.14.41.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 14:41:47 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 0/1] clk: meson8b: remove CLKID with typo ("ABP" -> "APB")
Date: Tue, 19 Mar 2019 22:41:22 +0100
Message-Id: <20190319214123.27219-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_144150_267630_2F0C702A 
X-CRM114-Status: UNSURE (   7.30  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a follow-up of my previous series from [0]:
  clk: meson8b: fix typo "ABP" -> "APB"

The previous series introduced a fixed CLKID. Nothing uses the CLKID
with the typo anymore so it's removed with this patch.


[0] https://patchwork.kernel.org/cover/10804943/


Martin Blumenstingl (1):
  dt-bindings: clock: meson8b: drop the "ABP" clock definition

 include/dt-bindings/clock/meson8b-clkc.h | 1 -
 1 file changed, 1 deletion(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
