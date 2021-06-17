Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57998C49ECB
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3611161004
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3611161004
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HN3Fbg/Lclko4YWPoqXXA+5By8phzI4ZfNxvDLtsio0=; b=2xvKnh7Bg7/BxL
	SlmJjilQu5ZUwAcHhSjdwL9hsRohkIwvn5FT5d0GdfPYJX/0lNCiLLLXhhtfcrg9Isz4h4cz+JGmx
	lN2dKAbkRNaAQHLgOi5E4r3kulk9lrUfP4DlVJt/XRxPaD2L/Twc4CnTKGzOFU78Z+W6GqC3IXXQ3
	ZziHpZo9o6mCjwAZKdTFqBWM5uTVyMqIhfKbyqE0uVtrlVUeITjfW9VfWluS4T8nSpe5lJ0hb4eQD
	VoTD+e5lK1flZx8UO+MpQ+HOtzYr2VtWll1+ilVwV0I9bKp3JHqkerTqx9C0GhMlx0wf+0RxzrSk5
	1UNQJmbot3yuP/pj2Iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu0K6-00Bvth-IU; Thu, 17 Jun 2021 22:17:18 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu0Jp-00BvnS-Va; Thu, 17 Jun 2021 22:17:03 +0000
Received: by mail-ej1-x634.google.com with SMTP id g8so12572725ejx.1;
 Thu, 17 Jun 2021 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ybMe0lmQbosDLY3cne/H0mPnypKlqLOjNhEtZI+tynw=;
 b=TSe1lIb7GNp6tmwWwLbF/rr4f678W+T+unft30gpSl49fgdPDf0VUq8jcKQCA0/hCl
 vOExD7Gdto+xHcAi2mgQlA04SzJlG/n9uWT3Msw6y50Pc8TIrsLQSJtIPIxOhV50No3x
 y6JIX+LXXOxXviA86YWI5eGQDAqVzk54/Iym+cL5Bfu6B0nTSsmx4+ZVuZwpIWzCQ7aK
 b9PBUaBixEbHf43+HuJTTJzKjzeHAhqi1sezSY/6iJusjOJEOig/ADSGY49Ow5/KhuuJ
 SnFqMFrCqm4rYfvIKQCh89AtCM1tUV66hIv88Xf1AFKhGv+hGGq6MAxVVCOcj8nb/ySQ
 XbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ybMe0lmQbosDLY3cne/H0mPnypKlqLOjNhEtZI+tynw=;
 b=s6NScCcf8iZkLGuqrTtK3CRs8kamJjzonGx9899GjHsQR1VRr4eue4cy2m8pShvxba
 siUEpme/yArR/lA/ERL/to1q8QvUk7iRFxmecb+MkKzM6FhSTMnRgQwurY0pf0DiFRvW
 gqcLzV9Z+EdMbDqLCcbhCrl1iwra5KrWg1QydSRWDwKI5oA/wonfXDQJ0Ta2PGoDNtEs
 lQt3wQ5tZzY/MytkpXbfO2+uj7i7QfuKmfriAcjSCpeNzyUPOi38+6qkYAuJrl6gOI5w
 qdQHgKD8yPbPFfoZCRJskke/2kDNjzOj/SNRxxHRcJ4Z9YgnP0o1cHS97JNBmJnBkPn6
 20xw==
X-Gm-Message-State: AOAM532lz5jB8ytLmd40bbnwK20V/VUC1EsfBwd4JaN6jKVwMaFZabq4
 EDPni7JeBaEikxkcTXiocX5F6vREK64brRDhyEk=
X-Google-Smtp-Source: ABdhPJyHiCQZPtWEEUn80WFtwkk1XE+OvA8BVP6yd4SX0BugyxFtURFkuWV+GY6KXpOzcWdy7DhuvpJFdY0ZgjAKERI=
X-Received: by 2002:a17:906:3b99:: with SMTP id
 u25mr7628425ejf.539.1623968219820; 
 Thu, 17 Jun 2021 15:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-6-linux.amoon@gmail.com>
In-Reply-To: <20210617194154.2397-6-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 00:16:49 +0200
Message-ID: <CAFBinCD1dJ=oqjzkCrAdMMdxF8W1Aujcwo20vJ1oLv=mtn5TZw@mail.gmail.com>
Subject: Re: [RFCv1 5/8] phy: amlogic: meson8b-usb2: Reorder phy poweroff
 callback function
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_151702_059831_B7771341 
X-CRM114-Status: UNSURE (   6.43  )
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

Hi Anand,

On Thu, Jun 17, 2021 at 9:44 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Move the phy_meson8b_usb2_power_off fundtion to avoid compilation
> error.
>
> drivers/phy/amlogic/phy-meson8b-usb2.c:247:3: error:
>         implicit declaration of function 'phy_meson8b_usb2_power_off';
you have introduced this warning in patch #4 of this series


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
