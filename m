Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25F9C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3i9SdbXV6KXwLgVq8LPIjQ43/F/mNSAZJF+tlPzSZLQ=; b=qL922oS/HwVa2d
	dANs05KZY4UPQ94L0+IRK0RaSZ7LIy4lqNnEFJywIt1MDe4FZqfpaNR3S6xXTguEH+SAhE7NsWI+I
	aG+H3xzzWRIesb95z7n4GsAAyeOcOSh30STh8ITl9slXe+fDMOtBJ+5RdIrjF+Im9sexCXSHBgJlp
	rcj9fIUJqCgXQT7aV+nBnYJ3S+p7Lw8RL6vsKnlVlRMxR0BtW7Uxr3gfhsbBWqLT+o7k+1bIuGCsn
	lFjuifBH7eLBNmtkErEmowdlOCroVX5BODjjIUIISjwEsGxx5Vyk4/wWwFytd6QRBCiTyG9KYLTJX
	32CjZlQa/gRrA+ZR2diA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw9x-00AH83-3i; Sat, 11 Feb 2023 20:07:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw9e-00AGwC-46; Sat, 11 Feb 2023 20:07:27 +0000
Received: by mail-ed1-x529.google.com with SMTP id r3so8241611edq.13;
        Sat, 11 Feb 2023 12:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kG8SI5lk4Wq0dbZT4Ec7NosqXm61vMmy3hObpjA2IZc=;
        b=k5+0Knye7J7VX4D81XzhGiZ+9tChr3///NJ4MrDKP4U+5wdIltqlQGXlbWXlAg7t3L
         MER1ujRwcUHzDXwF9jGmpsoKvitNhBT+2ZZSNCHHHovLLakV+YGkqwGqpbjaYpwa4gxE
         g7FNbfHHjaQ/kLDqhd1Kvq/NuP13bXmUAwQrg35L5NI1dLsm/R/zlw730AlHGpzJhF7G
         L3fwVhZXQc/eMebVEhrfJeMkbpSYXePTy1O+2bFC18s1gDqe7MYedgUR/GowO68mvScd
         RD6s76F7mqR3ruj8dnRq0fdYTq+XeBdD4991weGMkVWSfsJ5Hv6rFOd95DZriyc4tcz2
         eNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kG8SI5lk4Wq0dbZT4Ec7NosqXm61vMmy3hObpjA2IZc=;
        b=YnI5BnjHTXvD5B5ti7Lrg30KhJZoE8t5UJLHEwjz1A4QYiojbCqGr5mLDnW596g4+Y
         mHaHYzkFcFO/dADx/K5vf46nmbp+HQ0dc98vqWMvu1P8e7M0lavBshK7J6Y5MCB7qz44
         5JdQFsoKhpFWEoBthY3zjbotv4McRMJs4MfSpR3LPXDGu3Ge1k9vcDNaSgCoeWpz22Jx
         BggEDI5h5r6WE6uyTNbBtdVXGTJjPrrRQrRWFecLw1iwJFXlqgo/quR4/CZC/z0HJlYZ
         XkOSrnvs4TDiV+dobXLjycx+xmU2dyKmmbhBcrmyTJPLgwdWVfTtsgzg3EBaqqNNEFNB
         A7Uw==
X-Gm-Message-State: AO0yUKW3UKMse087UPSPDSiGzmWoQfB63ogv53JFQgLqeoo2pA+Rqrco
	n4wpaQ3YFIlPKpGYPnDhfQtHZbQ2hcPM0sOmFiQ=
X-Google-Smtp-Source: AK7set9nS0fut9ZHNQz3fcL8p+lHgP7tH2A5aHREwYFWjxICRgHFV2ZrlN0YGwlc1x7JdnLrAVb8QDOc7T+rKG3O+i0=
X-Received: by 2002:a50:9f28:0:b0:4ac:b7c1:9109 with SMTP id
 b37-20020a509f28000000b004acb7c19109mr963146edf.6.1676146044196; Sat, 11 Feb
 2023 12:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20230210170721.1285914-1-christianshewitt@gmail.com> <20230210170721.1285914-2-christianshewitt@gmail.com>
In-Reply-To: <20230210170721.1285914-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:07:13 +0100
Message-ID: <CAFBinCBC1ES1waLyYjUyOyK_d3DzoUhnQ80_rT3SBrMsf6p3PQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Ferass El Hafidi <vitali64pmemail@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120726_266928_7D2DDF23 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, Feb 10, 2023 at 6:07 PM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Alpha-sort the nodes, move the default line in the LED node to where it's
> normally found, and remove excess spacing. No functional changes.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
