Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE69C169C4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:57:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 998392070C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J/XLSDXy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="piw8nFlr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 998392070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Snp3L6a7/geMJHHwbG3c09eXXa5UeOCcY39FQss7Ow0=; b=J/XLSDXyLyFjcj
	q/172cR0IpEStTDtAhZtLD7fJ3TrqAX0Q6hnu3EyR0hXdKT/V+Wx/nYzpnWL1UOWWDJ5i5Hfcevkr
	ZkNpMI+t1rfbjpXOmRQx2BgEbuBCof89TM0jCR+iyM4rGSzddJvPgfMYhKq/a6prqGqXMZj5TYzy/
	bEtCVPbc6tZxjLumHGeLgUfVwwEpGc6YkHCBsbqe/elJI2hzx2QBw2KIA/zRLE7fGRavCaCS+hjNd
	+zahcqAJKd3ybU5b8vhSibE8qGGpLvDWGfMzYn+TXDRy8ifMezMnlIHihyLbgS9Rgh9VH/5P/zddL
	7SXN4jhH0/w+NfneSdkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtIdh-0005WC-GE; Mon, 11 Feb 2019 20:57:17 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtIdW-0005Md-4x
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 20:57:07 +0000
Received: by mail-ot1-x341.google.com with SMTP id 32so460493ota.12
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Feb 2019 12:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpgZXQKUHGxbIqJILVvS63njtr5/ciRcnd20wCqjbUg=;
 b=piw8nFlrZq2/0EygH/i/aL177NZWDlM2kAxPT77aHxg6kopuR0q1m8hPl6bBSPfyU6
 8/3iDav+rZFA7hcLygGYFcrzhcfRMY3Tx/CfbIjCSdl0MC5rtCfzKPOE/rhsup9YW2RU
 Dbd217sFxwWI5Glxt4soH/79WkLIDKdkf6tM54ChvnZGprmri4VRySz2nBEm+iOibw42
 HzB1TzhlUisS2Zz5/AgmTM27v8ESKSt05Idxcc4W+zvGO4dZbk1DhkuGRcG9KVGd0gkN
 /Si+ekxnQS/HZ65nAYXHp5voH+9VXEbxvdYdaf7/lOka8FyCZuHKkdTELo0ql8FI+7m1
 k5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpgZXQKUHGxbIqJILVvS63njtr5/ciRcnd20wCqjbUg=;
 b=QT1tA4gttKCWCFjs1rqwVd0rIq2xFf0giCWY4WTxq63ZnY31v+6kj9bOL+bC++z4qK
 TVprldboVYsP/bW+MO/Ua/Y2mEe4cFsRtDrlALgIaxe2rUYBxnk+KP2OqMHYDOmR6Af4
 uE2z4Xxk1XEc8vqbLaJJS7N/j/IpRhHmv2ay5FGcG3SO3uUuUKLQ5JCu9wGu2xkpwgaH
 S3tbeoZ6Wawhyfh3+0hLIoNKRmn8LuQ/b3BtGQwPdSrFun9XI6m8dS+merf4TlnAUldM
 DzLCkdm84JgiBa4jL+71Xdp0Wk8rBWfphjapoj2xe8A8tRis22aBa3cEBEgZ2lzsPI/5
 ZpDw==
X-Gm-Message-State: AHQUAuarBbq67gmj9ELk4ZD6afwn+8/QVMrUB673B+R/eR6VSQxYqMDS
 8gifkEvJXqTcrHn4va3ZgnyzVlnmqzJYh2SB3h7BoQ==
X-Google-Smtp-Source: AHgI3IZaVpn+kmWSPjdH6sYpW26By63gEVIl+kx9+pbwY+wVpVNAisTLT2mml7wE4O3As9h8nsYcnNu3XNf1F8olhTc=
X-Received: by 2002:a05:6830:1658:: with SMTP id
 h24mr119347otr.301.1549918624943; 
 Mon, 11 Feb 2019 12:57:04 -0800 (PST)
MIME-Version: 1.0
References: <7himxqdpad.fsf@baylibre.com>
In-Reply-To: <7himxqdpad.fsf@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Mon, 11 Feb 2019 12:56:53 -0800
Message-ID: <CAOi56cUzSyKVwLoEZWba67k9VpQ19Li9dd5c85KOogqOiDQfKg@mail.gmail.com>
Subject: Re: [GIT PULL]
To: arm-soc <arm@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_125706_189443_7DB7E5C9 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Feb 11, 2019 at 12:48 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:
>
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc
>
> for you to fetch changes up to b3077ffcfa24b05c05af3b990d97a392ef88b22e:
>
>   arm64: meson: enable g12a clock controller (2019-02-08 09:30:25 -0800)
>
> ----------------------------------------------------------------
> Amlogic SoC Kconfig updates for v5.1:
> - arm64: meson: enable g12a clock controller
> - drop unneeded COMMON_CLK_AMLOGIC

Please ignore, resent with proper subject line.

Sorry for the noise.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
