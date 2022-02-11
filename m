Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54978C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Feb 2022 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1i9DUDRZ31yKGWlbL86xEipiC5ei2fchUXicRwQhVTc=; b=cZHEc57n9ltFI2
	kht9kNrj93z3sSYR46p3HAD0wCioGIW3OGZ1kq7hxogrU+w4ySGK5kku7emxw51Jk17L3Rywpzism
	u2rrhz+VVyh6KLZWcpyusXaL0LYNJBONtaIAcri4WyG0yp/AYM9iUUNXB2j8TY7EBGSdHmibS8NBz
	6LyP9/V9UOlSbcH4vTtUx3yfLpu9lfXfo10NFgbtfAqZ3dFnBbEnJ8yGS4WOeF2vxT11WWNsukgEt
	JX/MSknKOYvPML5rdxrQwJkCilSe6r9LH5dPvQlWC/DXItZJ2tWYtuux9QWRL9Ntvu9lDhlNwGB6I
	2r3LcnMN3+iwBeoAm83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIb2E-008TX8-49; Fri, 11 Feb 2022 18:52:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIb2B-008TWb-Dy
 for linux-amlogic@lists.infradead.org; Fri, 11 Feb 2022 18:52:45 +0000
Received: by mail-pf1-x42a.google.com with SMTP id a39so16993326pfx.7
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Feb 2022 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0FQei1pY0LCHqipBs4sfkYiChk/zz8y1S+0ZsU19zEU=;
 b=K5CiLU5WhgRjmRs1DCvUJTCXND0gyRLPtQr3+M83VzP++0jx36Km/ZH5R55/BnPsvF
 9faqVoGMJnqxWSwKQV7A13B67u0G+g+zD1Snh8a0QLYxtTnKAmrspUH4q6r3jhZsjV4S
 KDX9+WZRAKGwdKAeK5+UpzNDveeZb5zYZeqb6R23sM5luVZP/Hq8eN5+aD4HoWNT+540
 JGdUiexPkWpCCKoUQ6aT9PZ7PkGWE9v/5LQ9C/KBO3+/KMArcLOP+HsffkojZon+bgck
 Uun9Y14pRIeaa9ZbajwhSmRoLyWlDTnqTcZaZcTlRwTNFfRKvl/Y+vAoGn8Uj2toDxcR
 vbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0FQei1pY0LCHqipBs4sfkYiChk/zz8y1S+0ZsU19zEU=;
 b=VHaWgCre5cJEbWu8ieRA26vkYLrKIVQPi1wX7BMAABGz61af9FHLsgUih/0DWRJFsl
 4fmtoLiHgocF2qXLCAu4bCfPXGaVUmDSqKf2AQ28oEV/cZM0dJLSXIyIzk2sBfJfYMX3
 /tOSzotMrCiPJzJgdCK5vqswdngtUNluKg8PKmhtPHzjcBEiaXJO/5aUl9h0wtaZXxSx
 NfwA7bHMOanG7cj7GDsSJNXo8+xaW+8FbH5pD8hlx293a8RuVujdk0TkmyDpqZzAgVFv
 dbAsd4xL/hbnx0HZDlENyp+/C3/v+ZQj7MZSKHv+ftya/CnDV9DzHxuR74YMOiPyD/lM
 rB1w==
X-Gm-Message-State: AOAM531pDAjn9q7Bob+O++m1cl4p7HVL+0CsIr/B7H03uZUjK01HdT/3
 W2bGwY472Xd59lb284ajT8YS0w==
X-Google-Smtp-Source: ABdhPJzp++F6L+Noa2Fd1DjatakG9PMYKetKo1YRVAGNl0SGHnPZ2qELdIdPw6iIhfZIPw5sFm+YIg==
X-Received: by 2002:a65:6093:: with SMTP id t19mr2449132pgu.584.1644605562030; 
 Fri, 11 Feb 2022 10:52:42 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k16sm28170462pfu.140.2022.02.11.10.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 10:52:41 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: "shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, "jianxin.pan"
 <jianxin.pan@amlogic.com>
Subject: Re: Re: [PATCH 2/2] soc: s4: Add support for power domains controller
In-Reply-To: <2022021117375354230910@amlogic.com>
References: <20220126061018.705338-1-shunzhou.jiang@amlogic.com>
 <20220126061018.705338-3-shunzhou.jiang@amlogic.com>
 <7hzgnal5yu.fsf@baylibre.com> <202202091001287547451@amlogic.com>
 <7hee4bok8w.fsf@baylibre.com> <2022021117375354230910@amlogic.com>
Date: Fri, 11 Feb 2022 10:52:41 -0800
Message-ID: <7hwni1me12.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_105243_577378_512B061C 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Shunzhou,

"shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com> writes:

> Hi Kevin:
> Thanks your kindly reply

You're welcome.  For future reference, please avoid top-posting.  See:
https://www.kernel.org/doc/html/latest/process/2.Process.html?highlight=top-posting#mailing-lists

> For those domains,  default is active, we hope not close when in use or not in use, in our case, 
> only runtime PM (include suspend) control this, so set always on flag to avoid domain shutdown,

my question remains: why do want to keep these powered on even when they
are not in use?

The goal of the power-domain framework + runtime PM is to be able to
save power by turnin off power domains when they are not in use.

> if you also have concern, we can control this not in kernel, but this not our expect.

My strong preference is that this is controlled by the kernel.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
