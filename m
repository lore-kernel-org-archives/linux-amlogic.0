Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FCAC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Dec 2021 23:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnG7iNfGEc9Jak2VfW2bEWLoUPWK7qZUptRyaD2lOBg=; b=gTWzF+up8tKySy
	UNGcCSKiDWUPb7k36vFDhYQv7o4SS3kCF+ySI4THmHT9Uef5zNxN00EjdXWzsE1PGCKKz35WD0VxB
	kd9hztx16b8CEciV3eUoCKfuLpJ8mpSHCsMLKttsEMfUY57lmDxFPBxyhyKjBdOySCD7Cb4vmmfl2
	w1XjrvPabzClqPW1OQcBwa2g2clqImStvcxK/5R7oJFRYvbwQfUhFxurshjq+5Ehfmd3dSXwn4ad/
	3YrSMX2VI1s7YGr5d/u+zu8rIp7mJSYroHN0ciuhmj66a+bk7ofDi//rtiMyyoJ16IurxJt3j/8AW
	EkqVOw2Z6CstXNpkHslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myj6D-00EzOX-VS; Sat, 18 Dec 2021 23:26:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myj6B-00EzNg-6w
 for linux-amlogic@lists.infradead.org; Sat, 18 Dec 2021 23:26:44 +0000
Received: by mail-ed1-x534.google.com with SMTP id j6so1999038edw.12
 for <linux-amlogic@lists.infradead.org>; Sat, 18 Dec 2021 15:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x21UNDZd13ubIHnGvzaADQ8CdE/91fQQxSjgewaikKg=;
 b=CyksZ+huq/x1AGVDBTspFPk/8e1QMHoC37zUtOgPqZO1Z1gmErMED7C9/sbD4ePtyL
 uydCNSR+71xn4sX6osXg5X1r6fTZALT2+ouIyeloYJr47K6WA8tmmMQOYpJk+ayqw0ep
 fLMHcZxrmtKSqCOh0FVkFEomQcVdfA57LIJofyEzyuyb8pFSXGy8KkHHME9DlwTaSsqK
 5oEmcZIC3KQHlm39P3bbYN6TIAvS+tETecmwnQ2lm86kBpmOeiO33gyMcYT8WNxds/es
 AxrpanQoiuQ4/LZzcNWSFRuKSAzFPjgqF156C/2UBePfWOOpPwJHjl7wvX7CHI2M2p5H
 BjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x21UNDZd13ubIHnGvzaADQ8CdE/91fQQxSjgewaikKg=;
 b=iYY/1FfPZfLeStr66qxdjxhtlZdLncdkZocHbrfUoc1hG1BcR4RpYj2q4vpphngDWG
 TaKTgnrXwWRFv/rg6hye4q+oHjnfM09BDP2+aUbHYPLIiJquJl9FPVKHvxseZriO7i9B
 lpz5ybpL9pRr+kHZmMkR6yBeaE2I8O3nx11EKWe6C2N3n6aycuqi/BcGV5l1o9HoaXBp
 uHQScDulLaMM3qIHBiREnQNlyyEZs44Hmhh0bCZ9AUx4IEB+0cJ1gALp6FSqXqrqQv7D
 9ne2FQUD9YgnSwFsmRhJufrpC/38uNRIgxukedcZtTnIFswJCqP7u5nXLPed2nvfLT7J
 92lQ==
X-Gm-Message-State: AOAM530Xvx5GPXsCzgLdp20q0M2lwatcgjnp+dRRWUqn7gms1v+Jfyqi
 lqONElPARk9qSYENFGVV46LJAaeoNL3HLnN8Jy8=
X-Google-Smtp-Source: ABdhPJxnnnGjFSBa456ilynkhm/1hJQqNwj67CEL1ADEIbXVn4hqx7bRKe+kesvXMde+7uM1sP1fzaWNkeGZdUriPO4=
X-Received: by 2002:a17:906:388c:: with SMTP id
 q12mr7742344ejd.281.1639870001823; 
 Sat, 18 Dec 2021 15:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20211218143641.19372-1-alexander.stein@mailbox.org>
In-Reply-To: <20211218143641.19372-1-alexander.stein@mailbox.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Dec 2021 00:26:31 +0100
Message-ID: <CAFBinCBJrTm886aa+2XTGikcQuzwD0V_EHuL6+Y1BdsrXEE14A@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: meson-vpu: Add missing
 amlogic,canvas property
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_152643_294025_AA9ABE46 
X-CRM114-Status: GOOD (  12.05  )
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

Hi Alexander,

first of all: thank you for working on this!

On Sat, Dec 18, 2021 at 3:37 PM Alexander Stein
<alexander.stein@mailbox.org> wrote:
>
> This property was already mentioned in the old textual bindings
> amlogic,meson-vpu.txt, but got dropped during conversion.
> Adding it back similar to amlogic,gx-vdec.yaml.
>
> Fixes: 6b9ebf1e0e67 ("dt-bindings: display: amlogic, meson-vpu: convert to
>  yaml")
Most patches which I have seen don't use a line-break in the "Fixes:" line.
Not sure if this is a rule though, so this is just FYI

[...]
> +  amlogic,canvas:
> +    description: should point to a canvas provider node
> +    $ref: /schemas/types.yaml#/definitions/phandle
This was also marked as a mandatory property in the textual binding.
Can you please update the "required" section below and add the
property to the example (that last part has been missing in the
textual binding)?


Thank you and best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
