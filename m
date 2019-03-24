Return-Path: <SRS0=t5ee=R3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F19FC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 22:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEB72082C
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 22:02:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sN122zQn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="l223+tlm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEB72082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=guvIQOJYNhQdRnvQWLxPH/xKQjGHXQr1LG9tVsbJYSk=; b=sN122zQns7Kf31
	p1JUXbUQvlcE3nq3VegtH1SwRCw0X7uBjLTY9uVc+BFwCTLPyC58Yk6GW9y7uN5c5WLoIXgk7QCjY
	RGk+r9JTXTE+Ail5f5o7vqw/IFrU3dGc6Pstzn+IlDJnQLIpombQjYufDbI/v/zxNupuoW5BLCtRW
	yf3ftgcFCd3YfGbxnoUFm6vD8Lr3KEnbOXpCbYN7V1dAxcpksGT4ahufB5SErmlZE1q+P9z1deWzr
	XGKL4jzo6Ix0xWuGJBl7HN9NyJ7ePD4HGEzR2NfyidaEV1rNo3uLWognUiwUh5Pto90CL1oIE+sA2
	upuWS2mRgrfLaPtkhVAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8BCV-0006cN-RO; Sun, 24 Mar 2019 22:02:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8BCS-0006bG-3G; Sun, 24 Mar 2019 22:02:41 +0000
Received: by mail-wm1-x341.google.com with SMTP id v14so7044510wmf.2;
 Sun, 24 Mar 2019 15:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+fyB4tI3gKbJMEPPqCvbrfsNxpucCIHFMC9GxrzHgg=;
 b=l223+tlmj3z0NLeJvTxzZWimnTsh1nV0CycvWZG1TaxDt/+H7uAb/H2jY+oar8yEHg
 DQwnqTePU+RWCD3KRQgpqeyl+GOU409bk8NP77wt9rInmAeg1PWNyBxmjWEtdA5a4pBi
 9vvrjHkJeERhiN5txXHgVd08HH8fTIbbYcIi+0zaAnyZk2x3YwwdAJi8KjPOxaug1pwv
 ELc1JCIFCGRWYxaBdvDIHl7EMoTBIxz7x7aNtE7jmrhg7+JjFMQCUEtNVy320ZRPW9V9
 W1HWokG+Keb7510GRtYArjGdSGjRPtQaHJASMq+EF++D0YbBvVWQNCBjBbUautCKpDp9
 nfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+fyB4tI3gKbJMEPPqCvbrfsNxpucCIHFMC9GxrzHgg=;
 b=G72dSAPxI1RR11rWvDlznAIA8jA6QycjUEEcLIBB/OKdut+T4lDw+vCD1UpTYr61op
 hyPso/ruOhUo9bZ7yfyAvX328ZF/cHuF2lVeIyQWkWWjRakl8987AuyCeuu9ecypOSBQ
 O893GTn5Z+PwERU+laBpebLL90yVBzvO/5Wqlqhe0svh4NOZWfQwbKXWo+OMe2e603Lz
 bbESGhRW67lpJrdT131wKhSb5Lr/yGCws2oMl1526ip59kbPRwbJNi7BkqBa15Q0up1v
 MqdwMQqbJKCMQatTxVtU3RX9pqdKJSn4FkXwhs/PCsmCPZOHplrkL6gSp17mrRghl9wN
 YdKA==
X-Gm-Message-State: APjAAAUozLPxYMA/gCvt4Y+SOdU02DHPqwdRdNW7xTkknKMPDF3f8lwI
 jzw6PEWXD4LRjCJqwrNaBllzNhSZ
X-Google-Smtp-Source: APXvYqwtHPXmQGHQZmmujSavXIzMLmkHXwZYnhyA/LalXDpzzopkoylRvJOHBeHWi1NSKBFL1oDI5Q==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr560348wmj.121.1553464954737; 
 Sun, 24 Mar 2019 15:02:34 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id o13sm12743485wmc.20.2019.03.24.15.02.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 15:02:33 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: thierry.reding@gmail.com, narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
Date: Sun, 24 Mar 2019 23:02:16 +0100
Message-Id: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_150240_191379_88571855 
X-CRM114-Status: GOOD (  10.07  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Back in January a "BUG: scheduling while atomic" error showed up during
boot on my Meson8b Odroid-C1 (which uses a PWM regulator as CPU supply).
The call trace comes down to:
  __mutex_lock
  clk_prepare_lock
  clk_core_get_rate
  meson_pwm_apply
  ..
  dev_pm_opp_set_rate
  ..

Jerome has also seen the same problem but from pwm-leds (instead of a
pwm-regulator). He posted a patch which replaces the spinlock with a
mutex. That works. I believe we can optimize this by reducing the time
where the lock is held - that also allows to keep the spin-lock.

Analyzing this issue helped me understand the pwm-meson driver better.
My plan is to send some cleanups (with the goal of re-using more of the
goodies from the PWM core in the pwm-meson driver) after this single fix
is merged (they can be found here: [1]).

Dependencies: none

Target version: please queue this for -fixes so it makes it's way into
v5.1-rc (so we can get it backported from there, because this issue has
existed since the pwm-meson driver was introduced).


[0] http://lists.infradead.org/pipermail/linux-amlogic/2019-January/009690.html
[1] https://github.com/xdarklight/linux/commits/meson-pwm-for-5.2-v0


Martin Blumenstingl (1):
  pwm: meson: use the spin-lock only to protect register modifications

 drivers/pwm/pwm-meson.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
