Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94323C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htjUZpxOCTLA5qGMX2IGnRdsD0kDtFaLvARMyPhidHw=; b=vRrIgGun7SM1sf
	uIyjbPzT0twdkjTcPq7r1klCLyEax1azJICeyHtmUKOSlz7zx0uQlG4ZkoviKSnS/ayhueHhHVob1
	8yXXfHInEEFaCStxFvAsw8L3JrK/n1pL5WxKY//WrwZwPF9DDWRNugDrOAFFL1cre3Vvl6WrstBTP
	awZCm6uUZw0Fn7UX7apQRIb+NlOjZtkNmrHBNcYyoffX0V+7hdEnBH0COKNQukQnA8ePoLxbS/25J
	QHeAvtjtIJrwXBu9vcGqkNlXewohiQhpVEdZsDfGJ74CycBx+EGTG4QA9hNr4cHv1ly9M4HWt/6DR
	Z8xe3frbTBnLTlUbILTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0oNu-00EMoX-9k; Fri, 24 Dec 2021 17:29:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0oNi-00EMmq-KE; Fri, 24 Dec 2021 17:29:27 +0000
Received: by mail-ed1-x52b.google.com with SMTP id o6so35589881edc.4;
 Fri, 24 Dec 2021 09:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d++DuyGAvsDciM6eGzuNhohbcfflkfo8Updj8Oi3lko=;
 b=Zcgxx/PFCm1Gk9GInJ75jZeRJmqq+ExTbcJMmRAvxyiOVA+59v9fa3/PuW3YvcvsDF
 g85lUn+o/rV5qvQGZiSuYuT+rLAwLPTeEAswjwVl2rNPxELY2uuymt+2Cf/jVIn8yATz
 ebKzbFXBB5ZkbiKrQnkh6i/RpKyZNGuCUlkp7JdSFASSS98wdgmqe4yhJgRQcb8VGuhy
 NEPmU/3iHbo5x/SO1JoU57djIwQzdt4IWlrTSY9nWipTxtfGe7KP2jof41JOCvMuFVCz
 rH9AR/PQv2INTq7/mlz0JHx2gdHAbLYUtVG/AXnE3RJmzCA+B8h/72Ff70D3rAwrJTGO
 c1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d++DuyGAvsDciM6eGzuNhohbcfflkfo8Updj8Oi3lko=;
 b=DdUFwJrkV9wgme4sA4LM8zGhNpaZAlI0KtTs3rXGRVkxg5wc6vynCMLFvJ5cOFSvmb
 tjPOLur6GqiIHp36aH6WgdQyJQ68PhvbFd1o6mb9L/hSHsTu1OXTzpdbyW4qXg92jh47
 mojDw9Vr5e2t/9c0iebCClApOclwrqU1B6ilQOmZdNMLhhDjTYEpwEkahXEztjZHzIkR
 jAryY6tILOmZvyM6D/+M95YqBG5fFeo/mtwjZGKZueZPsT4tRwzk1B0r2JFbBkXivMRL
 MFyIBsGb45yzjvOvgiBR1oXp/1mPVpIO22x329t7hqt78Qa7aLZCO4LjNOzE3b/melIN
 a/lw==
X-Gm-Message-State: AOAM532u6gZ40LlcTViSbPSlac+Hg4inEKGFjA5sJ08FD33FOzeT9e9U
 MRo8hiGwCYjxGhH2CjZcH3ELjgRzS75IYyb9GGKkpwdGQhA=
X-Google-Smtp-Source: ABdhPJy5VXGB5ok/CmgPeHloEn/RJrG5bmqnry8/oB6sB1YLfj9+63el5LzYjEmKrtfP3c0Dlx2ODZUCIBVT/XgsVe8=
X-Received: by 2002:a05:6402:518a:: with SMTP id
 q10mr4538306edd.29.1640366965079; 
 Fri, 24 Dec 2021 09:29:25 -0800 (PST)
MIME-Version: 1.0
References: <20211221030146.522-1-xianwei.zhao@amlogic.com>
In-Reply-To: <20211221030146.522-1-xianwei.zhao@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 Dec 2021 18:29:14 +0100
Message-ID: <CAFBinCDgQbjZ2QyTBbFuj--e6=mdxcd1PgYJNZJQFEvo3vco5g@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: serial: amlogic, meson-uart: support S4
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 kelvin.zhang@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_092926_685618_2CADB0BD 
X-CRM114-Status: UNSURE (   6.30  )
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

Hello,

On Tue, Dec 21, 2021 at 4:01 AM Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>
> Add serial bindings support menson S4 SoC family.
please fix the typo here: menson -> meson


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
