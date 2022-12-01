Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4770DC43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cS6QGsEUXHmTXnnIi5bxSdemBsLJWWphr9wXXbXY6E=; b=0leeWh4nfwRMfe
	loXfxzy9VQOOCVjKft3ph4CAlzIXSdGhzFyuhxV91XeUVY9qhZ5B2p2xgR9wp3ZDwKbwWXB9kKahH
	35li4GzRdtXBqzYgMLD5gxNgUt4RXdtzrM61jV0NbzXu05/T11ag8bYKmZ4zPJiFP63YFlAJSzzTL
	TEnyghQvFgNniLFGKtlWUr1Ksh/Fs4hcpCWMNJGUinECXpDH4P4BDu+JBTuofOd9C5wtikaZ2OoNz
	8QMKSlx/grfjYlcur9UlJJY579q4QKkjKZq6IhkjjpD/lESeiCKK01UbHRdyH5jDhur8R2pQojyc7
	TVl81rh8IBbpsjaec8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0etd-005pc3-Uf; Thu, 01 Dec 2022 08:26:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0etZ-005pZQ-SN
	for linux-amlogic@lists.infradead.org; Thu, 01 Dec 2022 08:26:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id y16so1475033wrm.2
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Dec 2022 00:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFqLP9k0bT0Mt44DPB2mvhK9vHSamghHlQLp/vyzST8=;
        b=U4NmYdKBUx9QdKiyriy5EwHSu8ZdemV5FMZ0WZoeSDd/MeA3b0sg6tfj0CpFSguPFW
         +U6A6+Vdcha3723PsWPhkeMWkMIkSsHDkDcjT5MU8q1X4MH36b50tWzqtzk/lqy5knMF
         zBplGMWWnsa3Eg+wFewWUQmhq9gAYJRThFp3rXiJkobm4wJ2R+YpKq6b2zcpyB/fWCGx
         wcRJXL43lcJQivcPG+EYQdSiUayYl0qIj+HTFlb53Iq6AE47P/rq6YkPQhl745qtYPgo
         auvpMyt7QPZAwEXytAfeKETc7pelQLqr4Rp5Scsj0mU639NkHNVw1i2U4IjrXlukyLU7
         JG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFqLP9k0bT0Mt44DPB2mvhK9vHSamghHlQLp/vyzST8=;
        b=duB/nyiiATazqXHVE7hkzP71CzaCFhvmgzYZdXG6qrOh+W9Jkja52deMoIGQSxI5db
         6qXWI0sL7JErP2xf/0DqTJbEyOW2Up4kPXgfGCXZZI756O0fuqA+003MdxaVbijfVhQB
         tnzEOqEX3gToEZDsjSYRdVa3y2Bk9F2MztL6lLkpKpw1iKijv+2nslDX1bY9csmn6vCv
         Fxmq8mhMju7JONQwnjbkNndAXx1KZUVXWkVFv+RmlqKy7ZT3NINIZwWlTGUdeJJYoYtH
         P8ByfAFfT3Q0+e+2aiCjFgwXvXVddDyjNN91JBT3OJ1gTkkudivDhRrqzwapU23MevCP
         6nRg==
X-Gm-Message-State: ANoB5pkgy+MYcB9xgIoKJNbuS63NBQOaL26QEp+Oe4q8f6xNKcw7wZ/C
	YpSmuiA3rFiRzv3CKMOgGh47MQ==
X-Google-Smtp-Source: AA0mqf4a5Z0PH/UgvFikZjY+k5KPvJuMO75nsDbR3SRjCEInYm+8Ie9RFm4XdT39bhTe30ft+HlBSQ==
X-Received: by 2002:a5d:4887:0:b0:242:1b2e:a8c3 with SMTP id g7-20020a5d4887000000b002421b2ea8c3mr11002249wrq.296.1669883172607;
        Thu, 01 Dec 2022 00:26:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m9-20020a5d6249000000b002302dc43d77sm3756176wrv.115.2022.12.01.00.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 00:26:12 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Guillaume BRUN <the.cheaterman@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, linux-amlogic@lists.infradead.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20221116143523.2126-1-the.cheaterman@gmail.com>
References: <20221116143523.2126-1-the.cheaterman@gmail.com>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
Message-Id: <166988317174.1947573.2294084268751804752.b4-ty@linaro.org>
Date: Thu, 01 Dec 2022 09:26:11 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_002613_940201_5A59A2B3 
X-CRM114-Status: UNSURE (   5.43  )
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

Hi,

On Wed, 16 Nov 2022 15:35:23 +0100, Guillaume BRUN wrote:
> Cheap monitors sometimes advertise YUV modes they don't really have
> (HDMI specification mandates YUV support so even monitors without actual
> support will often wrongfully advertise it) which results in YUV matches
> and user forum complaints of a red tint to light colour display areas in
> common desktop environments.
> 
> Moving the default RGB fall-back before YUV selection results in RGB
> mode matching in most cases, reducing complaints.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d3d6b1bf85aefe0ebc0624574b3bb62f0693914c

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
