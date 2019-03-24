Return-Path: <SRS0=t5ee=R3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B250C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 16:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4896C20823
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 16:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mBa9Ao//";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tt9+WuWl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4896C20823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l5xGP2PCtG5L8Jt/JrndUGW5UK7bkmTgDdGoGOPIxCk=; b=mBa9Ao//q056Sl
	56fHGiNMqDObSSlebeKZIpqOpj7+PoI6yp9ufVyYrShf/BBCPXIHDPNmyM01e4oTPxWNeP6Cgq2SC
	aOZ/0LWt6JbBXxkg+/2thadhG66QP6TaCSuW2rDek+zx331tpT8XplMiVNQhrDDF/Vu1gBQoR501I
	qhZL8LFVcaORVV9i80fsozPOV6uradedlNgykdjPqDT1XeNeEy82D80jQDeuJPaMljUmi0lhX//6A
	Ac2GI+lv8Mei7vWrsAFlKtrDm8L/Vhjor75YnDYHN2G7db31GyrLb3J0fM8z+ri1rID6LV82oMFd3
	ioab+pc8+1dohXblpd0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h86Ds-0007Z4-EY; Sun, 24 Mar 2019 16:43:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h86Dn-0007Sf-M5; Sun, 24 Mar 2019 16:43:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id g3so3946425wrx.9;
 Sun, 24 Mar 2019 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2r38gJpfFe4P7HtoACDMN8D+Ed6JJt9Nux7ChLwiuk=;
 b=tt9+WuWlBUcM3VoHmNt/kZywyCPpRq7NpHMDQI2bYrXvGbUwk4Jdg/p4HU6mWcnQb8
 BIl099tfJO592uJMq/LbjsAy7m//DnLgHRFRWsQWMLuX8v56fXaXzVnRZqulYl7H00MX
 nzBRRwwYXNhUSvhVBOempMLaSSThHwum8FhF35XUWAQ6gjocFAA00Olto/DLWxP0ZPJI
 /2S/quGgmUSe9m7wC0dFCMEzfii9u+kebjs+FBwqfhdCC7raXKAiIkhrn5TfcZxs2mWT
 Tqk3AZoZ6FFd4Wrc/BtuP8K+gSPNkhIIJYZW7s7YS+eI21NBHnWJAER9JqSV6LXB6lEX
 hmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2r38gJpfFe4P7HtoACDMN8D+Ed6JJt9Nux7ChLwiuk=;
 b=nQqo/85DCc6v41ip0TV/YisebphZ4CX9q8FsGeJAFp9roruu5Gwan5vxNO/rW4dMQX
 ElVtNv6OdjDM7PY8r3rbTHAZFHrLWuvwZHDRlkZdJJ05qRnMwEo2H3RZbZzaEfaMDsxj
 CRWcX537pvZVoVKW76/Utkt5+mC5CmO3Am8mFrV4MdXd71gxgEWbrxgpLDWYU3fy8q3p
 oGa8D2t8nR24e90JqbGuPjzDdzq+NHkJvyX+fPAtnX8V1F6v0renVmR9IHWl6rOUTWwT
 is02cQ8yJrK4BHsUDprkzGSoccHQza6gBazAPzL3/shnXHlFZBKpKJ5cOzp3I3n6pQoG
 FRlQ==
X-Gm-Message-State: APjAAAUKsI01bs7joLzI1h249RTcQTx2HSOoDQVJQpj1iHoCRvC+yePs
 HGxDooKLjKGxG/uXNeJq6AI=
X-Google-Smtp-Source: APXvYqxi7MrEGPvI0xo3HHvxXE+5nclfglXNSMkgiW0axjGrWnZa8Vm3ska1+I89HKUOFX6JXH12bA==
X-Received: by 2002:adf:fbd2:: with SMTP id d18mr12858946wrs.55.1553445817321; 
 Sun, 24 Mar 2019 09:43:37 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v16sm19042461wru.76.2019.03.24.09.43.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 09:43:36 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/1] clk: meson: fix PLL rate rounding
Date: Sun, 24 Mar 2019 17:43:26 +0100
Message-Id: <20190324164327.22590-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_094343_732810_A97D2E4E 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: sboyd@kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

can you please look at this small fix? I discovered that my Odroid-C1
wasn't booting anymore. My other Meson8m2 board was using fine.

While investigating this I found that it hangs while setting the
sys_pll_dco rate. This is important because unlike Odroid-C1 my
Meson8m2 board has a fixed regulator (and thus always runs at a
fixed CPU speed).
It always hanged while trying to set a CPU frequency of 312MHz. This
can be achieved with:
  24MHz (xtal) * 52 (m) / 1 (n) / 4 (sys_pll)
However, my added debug logging showed that it was trying to set an
M value of 51, resulting in an output frequency of 306MHz. My debug
logs showed that meson_clk_get_pll_settings() considers 1248MHz
(which is the rate requested for sys_pll_dco for a CPU frequency of
 312MHz) "worse" than 1224MHz.

I'm not sure exactly why the bug caused the board to hang, but my
patch fixes it.

Please apply this to v5.1-rc as I believe the Odroid-C1 on kernelci
also suffers from this issue.


Martin Blumenstingl (1):
  clk: meson: pll: fix rounding and setting a rate that matches
    precisely

 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
