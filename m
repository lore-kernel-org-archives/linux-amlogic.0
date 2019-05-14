Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F69EC04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:29:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13B0421473
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/uMY/u9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Mazte5J0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13B0421473
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZhjooUIQWVs3Kf30rgnIkE2SxKOuTu8aFk/dKQW636w=; b=q/uMY/u9n9Nj+y
	NPIuMp+1aoOGUBj0BIHx+QkeduUVyVheiz9k0eWSut5+6Vsgo3U+ZnRqIRm8XBSFeMxKKu6fvijgB
	0F2z5lA95/OObLDNQnCGJvCG1ZYM5aFGyErJhVFzoZ5y368/d8fNyR1fb0risbsPCFyZDZDRY9UYn
	QT8wrhVGTzU+qs8ozlawM5SzSszNUR9X5rdsMaDWR72pk72swej6D9Toxc1MxyWXkty69nZRDNqBQ
	MNSnbFG7b7gkJb6PqBOmRtuQ8CJGcNHbJdrU5I5QRnkwmT9iMDnQZmSLYc2BC2hAfqmup2o6xs+LN
	SWOu0Iddfr+exYHnMTgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQcAy-0003iy-Pa; Tue, 14 May 2019 18:29:20 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQcAv-0003ia-Kh
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 18:29:18 +0000
Received: by mail-oi1-x243.google.com with SMTP id m204so12924427oib.0
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WeXlOJL3K8v7KWG3tXskIvOY8eKPAZMh5I01Otu6OTo=;
 b=Mazte5J0xZY5ZnJfnGirkWTAZb5+4/H/0co+UgIgZU/D1vfggLqWv01UNPYuKhIq9F
 OfHXSuq8vva/s+Ar+KXiMBzrIhJnPtcEjmPop9A/n+keRtck9Vg2GvLn0xjSOptk5XN+
 9hr/1bl14aFkba1o5tFjeXVysOyPE9ynh8b4tlq19M1B+FANVS/b8w0l8fkYqjLq07iq
 2E1OKm4kUFZOnKZ27oYHQm7RW3qwrN0lxooI6r3DlMKaVV+AORj0+CLat+OkfYhaUpfE
 Shpipt4CmDiY27XLMIxF5VVNmhifPPuzasJoSlfG0soyk5Vu7Y834e9KDKepFbYeSHlH
 xR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WeXlOJL3K8v7KWG3tXskIvOY8eKPAZMh5I01Otu6OTo=;
 b=BNjCJGiUuPySRuZENUqO6vZUdDUOo6ef1oaC6ldQNWhpwlBkmUK3I3j1o7ZeMfxyQT
 TOHWXfSQG/CNvWoEV6t51osDg+t7KeAweP/DwYU1c23/InSrzAn2EBz4bjOugDgsTyQ8
 2U2SRI+cSJzprlO1tfZ1/pFx99ZjCo9DRRRInOODXFSn5RKRtS/qisxakb/rWSBvA134
 JGFQ3BatPw5hEaaR921EKZc3nIhovaXUC6GocrfH5fP22eSR/VnCSJ8lmdLtb/dn4o5Z
 w5nt4Fc7pbzY7z02WQmaSuHrHKL5bPfyHO7loBS4mCc1yD+IdJaEhK0ZV2szWC/sBAk2
 MOtQ==
X-Gm-Message-State: APjAAAV39pEJdyErzfcN0YjujO7hO8BMSYVBdnl9HyEwFcsEKBManFVG
 +o6+/t7r1zOhPrhMsjccoataVekVyniqQe/oybs=
X-Google-Smtp-Source: APXvYqzl/vS4QgHDQEBICZ17isICjtzP1YI2jmHtSQ5pyW6Bkeg/9KCzddZ5Rl5YpUXAKAtnHUPcDScg+Nti+VynZWw=
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr4077569oif.140.1557858556579; 
 Tue, 14 May 2019 11:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190514091611.15278-1-jbrunet@baylibre.com>
 <20190514091611.15278-2-jbrunet@baylibre.com>
In-Reply-To: <20190514091611.15278-2-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 May 2019 20:29:05 +0200
Message-ID: <CAFBinCCrJ+qXgKkDrePWGriYyttwjHV+8jgT=Hk55Mr0VNhw7A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: meson: g12a: add mmc nodes
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_112917_679626_1CD1FB0C 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 14, 2019 at 11:16 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add port B (sdcard) and port C (eMMC) pinctrl and controllers nodes to
> the g12a DT.
I assume port A is missing due to the controller bug (missing DDR
access) for which Neil has sent a fix. this shouldn't stop us from
adding SD card and eMMC support though

first I was surprised to see that the MMC controllers are not part of any bus.
however, the public S922X datasheet mentions the MMC controllers
directly in the memory map (on page 83), so Jerome is doing the right
thing here as far as I can tell

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
