Return-Path: <SRS0=vTSx=TM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25113C04AB4
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2019 19:43:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD8820C01
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2019 19:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OmgZU/tI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mvbKPUtz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD8820C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NEPXXgEMD6IwXrfJQ1dfD9pB6YrJE7nodFygfVTMAKQ=; b=OmgZU/tIf/kndh
	/HpwRotsLoQoWpkKfGpOvYoeF58TAow7pJAOWhjgOfm57b9N7XNPAffX6TZNt24RRgyA9+A8Ybn0D
	37qnNu5L5x0nW7OcOaX2Lo7EfVY9rX6lZ1Vm+RSIRawmenZhsmkOndC3UnttA8evNH81ZUBxfb+Oy
	dlg+BgBLjRBh9QTR56BfcsQu4dnUG4dgcloOC8HPXdo7E+MXCi7c9ZQL6in8hXipH8SaWb35jO2x+
	0FwPdE0YuWT6nwqfYjltU+utRkjgLu1wGX5RIcqxWrBWCB3wraSeKJ+czkLlOzHTogRqHTZrhue82
	zHgq4InsTtcHH76IOeSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPuNP-0002yY-7n; Sun, 12 May 2019 19:43:15 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPuNN-0002xw-5g; Sun, 12 May 2019 19:43:14 +0000
Received: by mail-wr1-x444.google.com with SMTP id b18so2921117wrq.12;
 Sun, 12 May 2019 12:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YkKnBKUFEKkDHQcg46RtzXFD9NeWizWJPkqwcfN4Wh0=;
 b=mvbKPUtz35AGODuQ9K5K6a9T+agne7rqu9/Qr6o1q6lNuwng+f59HDCKbvTvdMlJ6c
 tay6/jDjraQPYW1yUkEX32PfpaWB9yXprec5o/OLr4xfqfIGtmLiFZNGzGQSZA1a/TX9
 Kab/vzHiIfFZXzV4zrPTtr2VW74QWPjDHVeWcv2VDSmkOF/CD4WUficUaKu/UmHSgMsS
 kM/USbd+tjhfVG0CvGBFR2hglW11J++QoSeo1I4E3zyeGR2JwPClPed6M5rDxkhr/AU2
 IxDfmUb27bzNVkGpcVVo+otej5AgJqxc7JJm5pKUvRuyMiQBzJwsxG5XN9me8m7pS/ya
 IZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YkKnBKUFEKkDHQcg46RtzXFD9NeWizWJPkqwcfN4Wh0=;
 b=YAY1BXcczaaOUK2J/Hp+Ws5086aUqe5XnLGz0Rlt/WNNJA2NivlVo6iF76oLHtlWcD
 rnJ+lFiwZ7wf72xpp/xjApQApCxoFFDLMAsP5O5k/0ZXLExBWeiZwgPAW6ot42f/A23g
 n67c5gxjSwHayhV3pKBUOXQZdjaBgwLUbSj5aNeGK0qYzeNuFZkpSshejJw++8E39KQi
 3qjeIIy4EdQOYnIXHNZP2iydHS6QH8BN9SkjKdMP5IzJ1evGW8nDZ3gge2XQDgASmNOz
 5LArPV9GKcnCSForONQRPlnNF9lWn/otM/657OLgDr903n3K5buzGM0tk4o1v1QsP2hB
 ZoAA==
X-Gm-Message-State: APjAAAX/dhu6DNwK0ysOI1zK5Nu1mnsOK4V+DcunxrFNAiavKMzcpLjE
 5KsG5W6Dgr2oSiKXMT8XfjsrdI1bRQo=
X-Google-Smtp-Source: APXvYqy1d05NDscbWQi/nz+Tj2aWJx8x7CvKkvlyeMlWGow/RSrPZ6ZGd7eG1OmLtgniNupyS7n6mA==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr9410128wrm.153.1557690191211; 
 Sun, 12 May 2019 12:43:11 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD00ECBE9107EA8EB108.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:ecbe:9107:ea8e:b108])
 by smtp.googlemail.com with ESMTPSA id r23sm13685178wmh.29.2019.05.12.12.43.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 12:43:10 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com
Subject: [PATCH 0/1] typo fix for the Meson8b clock controller driver
Date: Sun, 12 May 2019 21:42:59 +0200
Message-Id: <20190512194300.7445-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_124313_216708_C9D3CFEA 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a simple typo fix for a clock which was introduced with the
v5.2 development cycle.
Nothing critical, so I'm fine if it's queued for v5.3 (no need to send
it as v5.2 fix).


Martin Blumenstingl (1):
  clk: meson: meson8b: fix a typo in the VPU parent names array variable

 drivers/clk/meson/meson8b.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
