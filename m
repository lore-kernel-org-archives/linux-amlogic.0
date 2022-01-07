Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F77C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 21:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otKH+wsMrwXE3KoKHS+MtuCuy0CsJTFgIHmWnZ4lVU4=; b=nnQntf3ECeqzAg
	z2uYon521AQ7j3LDGBpuhqn8QrUpW1K/7VpuR12nVl0VQgUrtBF+BCfrMbqOEIoI19iZPcd+p8Wtg
	mjnfMIddt/JeoiUi1XpsCCEVCJO9zcMKsnbqGZvhAAiKeTE6MqbXo4wfIhLi9JaJCopL0Sd1CCRLP
	U5wxNM52sG5RAOsLxI7eMxSV8uyiv0XabSEU1F+gR9HmwX/0vljo8yN2d3CUinKdnyJOMyyKBMZD6
	GX+mLvxPf4doQrnUYdySe4cH84iqqUATKhIwCLxZGTx/mkVSYHXBCzvG0lUZLbX2BBbLTZaTx6LhM
	KguXnHDNyHuy/C7WKYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5xFv-005KPx-I7; Fri, 07 Jan 2022 21:58:39 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5xFs-005KNj-Mi; Fri, 07 Jan 2022 21:58:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 30so25521841edv.3;
 Fri, 07 Jan 2022 13:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Y+yvylrq8G9K24aTv5ZnK1lCvLyWIJOHvFwGQ2S4h8=;
 b=ScsV4/GFRAfwNY22P5ppslH6X6pBUQP05JYve6o22LMyOvM0tDvdnvAq3bETEIUtrk
 5LZBAP6u5NJsnVM6ftdVURmyCsgEaNNAwGKwUfdLe2+OqAmtoJGm4Kk7+h+TMBpfR0C1
 4AinlpD7xTuax7hzDAuzJ3dN2g/esM45cQJQbOZQDTWfaPIJzoNdIq7XeqzzMlhlGusu
 vUQgV8K6kV10TaiX4ibAv2go+zM1AC68O+wTSstLvszokcZi76acZx3ZCXmzjn8AJaxB
 U71W16gexR89e0nlH1eJPmGsE0/M66Pno5L3CckNrrJGKkad/ZS9UfUdOwZRGmIzLn4q
 6yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Y+yvylrq8G9K24aTv5ZnK1lCvLyWIJOHvFwGQ2S4h8=;
 b=J8S1axL66G0ilei4BK4X+8pN41zKiqzKBN85YKTtlUva8eODAlTfjIuG/aezDkuBB7
 muh2S/R0rsw4t0x9CMzSpK0EQivlQSEZyYAhBnIR9h+ItpnsU5qkd08AnXHiboGa0BqR
 DJnLuE7Z+gIaC7DLDNzMGrVu/EUZBZohwAGLlmoi4jlGJjEeBWcaHEZ15OaAoltrR8uj
 i5zBy+1DKaUcgRpgtikzenLkVyhNYPD47d8I7kngsBwRNDMuk8fOoRslLM50erfDkqMX
 P1xSBhVuJ1Nk8fPbtLscb5mB2IW2SBIO6dZT3ZAWipN5ZJ4XYnS8GXD6scwqJcvfpwT+
 r92A==
X-Gm-Message-State: AOAM5314w+mfbsoWPWeBJaUQRgkYIRUc9JqzuyortrWCPujITVf6Y9J7
 GzKglbbRNw2h14Ramrh7cM+4icD0jVBKJ6YC/mY=
X-Google-Smtp-Source: ABdhPJxwHPeEHPAjD+LC51Ae0NUSbl+DZBbSQw9QOq/pdLTaBbF3QqP9KZH8X/zObztoMoesIIbfXmUSn46MNuaZqgM=
X-Received: by 2002:a17:906:519b:: with SMTP id
 y27mr5429738ejk.649.1641592714281; 
 Fri, 07 Jan 2022 13:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
 <20220107023931.13251-4-zelong.dong@amlogic.com>
In-Reply-To: <20220107023931.13251-4-zelong.dong@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 22:58:23 +0100
Message-ID: <CAFBinCAP66AHM4252BwJ2FMLtyw2RzUsoitahpK0jNdgZaJLXg@mail.gmail.com>
Subject: Re: [PATCH 3/3] reset: reset-meson: add support for the Meson-S4 SoC
 Reset Controller
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, khilman@baylibre.com, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 jbrunet@baylibre.com, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_135836_771606_CCA0A734 
X-CRM114-Status: UNSURE (   9.49  )
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

On Fri, Jan 7, 2022 at 3:40 AM Zelong Dong <zelong.dong@amlogic.com> wrote:
>
> Compared to the A1 SoCs the number of RESET registers is different
> and the offset for the level registers is the same. Add a new
> compatible string and struct meson_reset_param to add support for the
> reset controller on the S4 SoC.
>
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
