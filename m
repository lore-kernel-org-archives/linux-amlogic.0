Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E758C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOxIWh7qzjbsLdBCbF3KwnAvppCs0VpPp+eo/GVGEUM=; b=AeHwC0VSJfJVAX
	/vEJX0fHaDyWuNPXCutKmQ3ddAOWdM/YEaM1JyzQoepa2WlZQ51mQJ7SIlbGZKSIt6D5Ab++n3rBd
	fHnDsql/Za4kW9hL1lPi7A88dX1W90BRmHapzq4QgdcUOGTrjrmoqYfMoufLg4v7SHToCE69SE5Rl
	8TIC7U0prIl9R6a75P2zHjHc/sM61vY1QH4QkSLnxoeD/uNyi9Px2h4h50waS292TokeOW8hdnWz5
	3zv/xUnCw21oSsPVaaQkdNtylEJ74N+xWy4BppRybyuJc1fK2v28j7Dn2DcnG3VHkNv1BzGRRTPUW
	5lOUtlRjc7mb+4s6KqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olFrp-00551i-B3; Wed, 19 Oct 2022 20:40:45 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olFrd-0054ye-JD; Wed, 19 Oct 2022 20:40:35 +0000
Received: by mail-ed1-x536.google.com with SMTP id g27so26987217edf.11;
        Wed, 19 Oct 2022 13:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SHoyPeO+yKlHEZz3rBetsZcxV3gDKtY4M4wZKqAJU44=;
        b=UzNgmdeOVI3wCoSDtw5phtRdCh6LXmWV7A8EjSQV4rzEUqMqIXUXjcVZgP+e3OMf6p
         ot77V5gUbJhRgLGtNoahckKs6LxDl9OWpYUlGi1qCIbUYOaSRvo5IiHv51DUbB9IreiV
         GT/z6+lboMwwuLfc0dBSdp71HnobwCLTsgtPY94Zfv4LmLwO7MCmTV9f2DbUv1roosYW
         BLs8dT8DoWLdQqFiyJW0jqumgfA3HJyXl52I7DY4p8zWwUFgguzpKn6CEHXmHXs8trx9
         biE7f0WeMOZPETXTNszAMPNNp+MFlUd5W1rL72ZdjwWRcaFoJvvbqmPoXThjWrdLvPhx
         VIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHoyPeO+yKlHEZz3rBetsZcxV3gDKtY4M4wZKqAJU44=;
        b=BDjH+/rfmvPr+LokUhtDv4BHkf0I8wQG/gajZuwxFx4HVZ6CqEwvPPlyWq8Tv6X9MJ
         TAbZ8IJchd0JPY9FXbYUXBnNZEo4euaWXiTqdzdqmIODLlCkBkQSN6D9D0zmh2V0DU+/
         RaQjTt5VU+KzMSoX06dY3n6rQYVtg/FCPJxctA4OPETk1rK8PQPKy8X1iHWT4Eodyss7
         nwqoEYQFaObQaxVLSL76EHGNjnHLYMpEu50Kypr7lw+HpJgwtktd6XPAMOxQwaEt+U04
         UkjZiCfdln5Vz/YaeggZtNN5XXf69GoEA7eAMRzhITy53Ke5v6GuXsVN6VLOfjtQFOIx
         yVEg==
X-Gm-Message-State: ACrzQf2k5TSKoEmQ1uH2zqizpOvcOpHJpuPdOQiu0Vn4kEk/tyGgCWVD
	srx+xLpkZCMbjoRmKyOR9Y+noJRpYm0OyKl80Os=
X-Google-Smtp-Source: AMsMyM6fJRPrr6+1iw5zNkf08dPmy3usxyt57frb+bnuN14stIeda86KPRYBoRUipDmTmUCZddfWX5FfeSat4d6+8rU=
X-Received: by 2002:aa7:db07:0:b0:458:f6e5:ab71 with SMTP id
 t7-20020aa7db07000000b00458f6e5ab71mr9373877eds.330.1666212030128; Wed, 19
 Oct 2022 13:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221018195122.8877-1-linux.amoon@gmail.com> <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
 <CANAwSgSR6jHRQR6QgzUop_B4gcOsQnfc6LoUXrP0CSTasZkVfQ@mail.gmail.com>
 <CANAwSgRLZfon5qUFeKW9U9AbHvSa=uKVaVgqghVk554-H1LVKw@mail.gmail.com>
 <402500e8-b4fe-9b8f-d634-e329191af1b8@linaro.org> <CANAwSgQhWrzeRcpQSSAmfp+i3966dUQdtCLbcWwifQk=1ce=og@mail.gmail.com>
In-Reply-To: <CANAwSgQhWrzeRcpQSSAmfp+i3966dUQdtCLbcWwifQk=1ce=og@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Oct 2022 22:40:18 +0200
Message-ID: <CAFBinCCyEVbc4N7TUEi=sbLFv7Rc-L=y-h8xBuZK446x1oLc2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
To: Anand Moon <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_134033_670576_E3EBCDBA 
X-CRM114-Status: GOOD (  12.30  )
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

On Wed, Oct 19, 2022 at 7:17 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > +&pwm_AO_ab {
> >
> > &pwm_AO_cd not _ab
> >
> No it has a conflict with CPU_B (vddcpu_b) PWM
Uh, you're right. That's probably why the Hardkernel team uses a
software based PWM implementation: [0]
In hindsight they should have used a different pad either for VDDCPU_B
or the fan.

I think the most pragmatic approach (since the "GPIO PWM" driver is
not upstream and I don't know if something like that would be accepted
upstream) is to use a GPIO based fan as you did in your initial patch.
Not sure what others think though.


Best regards,
Martin


[0] https://github.com/hardkernel/linux/blob/c109dec94e7e819554830acfac4b6ed96e230179/arch/arm64/boot/dts/amlogic/meson64_odroidn2.dtsi#L356-L359

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
