Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3AFC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 22:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dgh1HhN6rLYYLxy0y/GZi70j2DopkozFKzqgs/R+5/U=; b=PS8yeGwCXt2S/Y
	j8k6/ilwI2nSuXsG6NpCHtj/mGqZPmkiSf304lVeS36VAR7enLLH5HHiPE3jIatL+tm8HbFkzPIwy
	sgeujDAukQXCLft3tKVXdqVOaLXsFpub+n+queR7kDSxw1l+GkYvffKLRnlckRcyFa16XOnj0C4+z
	lDngTJb5mHtawvwPvYfXYHmBBfwMOb8nhSbo9IMBw1wMoRZiRRTUZ4wnthuFvfhl3x+tFxeoJ5i8X
	NtwCPWbzpbr1XqdjKxZFVOCPMwuhb1c5SoahPc8BXILeRdqimQu1Bt7T75sNg0AxKkJMjufVpD4+V
	ADt/HrrJvtgX3la6hUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5xVe-005NIO-VN; Fri, 07 Jan 2022 22:14:54 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5xVd-005NHD-3i; Fri, 07 Jan 2022 22:14:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id w16so27180307edc.11;
 Fri, 07 Jan 2022 14:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SySDfXOcDDxrxdLlLmdKDsi07wKtcEMMXGppknRGrbk=;
 b=QXF3IO5zOQty2LsLhkAjI+1Ed7n5kUIhbHd4d9nM8uYhasFHC/ZKIivnMX4GzrXxcy
 Bp5VHzAbuRdgKl85GD2iC0lv5n9gabLxH4zJpJPaUbNQQ8r31BGGB3fn8cLPUzWAmmNu
 FzCfShoplLGN01S01f0Aw8ayN1UifhovWLOK1EXS86yt9S2x1QLnYCqRKDzkR287aBLp
 Z5tue5rIyi3RKW9YDDsaTj5CYVE5KS4xznc4oO26Pau35D48nQ7IdcSlrxB7HmauUd4G
 7TFiLFioRbQmLQnYNWhnhG8tzA3MwdRnBujwDFNeidnBSLGf6rMln8BQd6y8A31zIClG
 Tcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SySDfXOcDDxrxdLlLmdKDsi07wKtcEMMXGppknRGrbk=;
 b=i/cguRxgbv1R9zqf6+ykPaC8CkaRnopXiEHzRxF95zyUWU4UCbfxBHFRtjdatMWVxh
 RGJTa7IINHlhr8qgts/H4OqTmYYtwoP+RBTKrhGWiitxrN2Nrhh3EdGmrMmcxrSPLrPz
 ys4GQP2D53PkKMa6XHYe2RTNegkfHhC9nt9qOJR49egTvkhALyNxL89d7eQiPhAPYvNo
 WPgJ0lX4PIys0tOGBZ6W54r27zR/BhkyrghRXVJSaImEjXAYKGRuCoEBtUvg9crtE7TL
 0+HPtNJ2UCKkTBZ1bqVu4qozn8f3L2WdSgeBxnTBp0KiEtmfPxLSq7bPNNXPO2gkCCFv
 8ACQ==
X-Gm-Message-State: AOAM531TWbZIU0X6FR7krUTmEy7HGqWDhay8EYQrPsW0W3luPR3u1A5X
 R8qI+W/rAn9oV0nJAox6QKiGr6wZwaz2MXuh7Qghw/HuV/E=
X-Google-Smtp-Source: ABdhPJwAVQUd7nG/enEXRg1iURonC7ksnQzp9JOzzkBuRvOF7MWlM/7EzXIRmvQCrE81lA1p/W6+VAkq/sYpAGsCL3E=
X-Received: by 2002:a17:906:b89a:: with SMTP id
 hb26mr9338135ejb.147.1641593691749; 
 Fri, 07 Jan 2022 14:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-3-narmstrong@baylibre.com>
In-Reply-To: <20220107145515.613009-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:14:41 +0100
Message-ID: <CAFBinCArnZ8XtaBtWa0smmPTc-sHvAdD7_-3iTywxUJ08-uyMw@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: meson-vpu: add third DPI output
 port
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_141453_191099_C4DA608F 
X-CRM114-Status: UNSURE (   7.17  )
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

On Fri, Jan 7, 2022 at 3:56 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add third port corresponding to the ENCL DPI encoder used to connect
> to DSI or LVDS transceivers.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
