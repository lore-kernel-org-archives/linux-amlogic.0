Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0330BC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jan 2022 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAZQyBo4iIMvsOAdwIMIHjbtOr8ugoll07oEOBobuq8=; b=TTFmaNM+4WYtaL
	0IqHBFGeLv+CkKwnP6Pg0r9qMLSuVgjLDdq4KJ82EpPcdYFqro0g4uFZTbwbtvqHvXD1ykiQAP0aN
	kynTeL8c1LkKMSXmvt3b+cw4JtZp75j5IO0AWqHErPcTdo93rbYuaGNis3/2g84aK+nVmSKOoJiSf
	9TOt6ZX1s4NADIiyM7avWCB0CSG+lsICzgYzhbhNl3MUj6qBZ5z4rErzZ3FYiNJmhQO5F7wy3MGjN
	844Yu2EhsFxrOmpogrHlkNd8+Fua9HC/s1siT6iLbbiY3yiI11D0awT98EJxeiJVnlTVuE/Ucv/iS
	NtlQwzXROLvsYD+me4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC5To-004zWp-Ec; Mon, 24 Jan 2022 19:58:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC5Tb-004zST-Ec
 for linux-amlogic@lists.infradead.org; Mon, 24 Jan 2022 19:58:09 +0000
Received: by mail-pf1-x42a.google.com with SMTP id n32so7980250pfv.11
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jan 2022 11:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HVGqPcoZ6tA4nJhZfd9qY6ac55uc9ZaTu5VnzL123sM=;
 b=UoZnDRjvtwLGL+ZkFcMTRUht5RIXtnBkTp4T6OG0AtGfMmQrPFl9oEQK+LSaOTD9Ff
 4IgMBC8I2mCMgPlfBJQkK3VHrxcha3AZYVFNAwOwcZzAmgea+bvbp1UehK004oOm9ZDt
 2GdGVRW/O0rVSL0okB2EzJHABeN+B+OCzbNa37efKF4UpKfDdcUMbdtqli79nb1lYgdB
 AhkzshqI36hc2fxfBmdAMwT8yif1sH38wALztzkS/dESmgamvc5nJuOU9Q76HPIk9AwX
 7kdNVBsNmfqu7WibSmnqSXB8wzieNrEyCiyFmZxO0kIq6vvmJSYZRLX9BvSnuIltj+iS
 aGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HVGqPcoZ6tA4nJhZfd9qY6ac55uc9ZaTu5VnzL123sM=;
 b=XsF3VNqzcHPFVvPRXkeFJHkOGk3m3TpkdyfkizbQkh1Pcf3pGxsUe6Omg+DXQf8aAq
 3+qDKkIj192k3EIEcpYNkk/Y0LDr7lNnqqAzQ4MJaxnVJmjV9UB+QvnoEtb7KKGNi54w
 0PTbefGf/N80B2pJWXD3Yk9LZqh0R8BIlRa0SO6iyhTfJvyXS9x1Xr0ol/v0y1f9/XhJ
 UulS4yF39HwKhvehr5GK+kib20svL0VTfda+cxnQaR6ubhvpsD7fFGWGpEg8O3hpqcD0
 YbIxGJ2y6dmisX9iqs9Ofva2jnt++fwp3imS73jnRC1rB11lSUy8nmCuXK/Q38lX5OXS
 WO1Q==
X-Gm-Message-State: AOAM530srZqYeH5t+88wCJYYx8DF9Ux14FEvk03nTUNtINKHf0DuabEz
 +JFtsF9hvcnvWxGcZbLIDkc34A==
X-Google-Smtp-Source: ABdhPJx7U6j+SQSA5xpuk5vCxWu3Ky4xUij2eceN7DEhp+Ycho/C63+AuVhP3jpxuBCnbaR6tX0zww==
X-Received: by 2002:a62:e210:0:b0:4c9:1cff:15cc with SMTP id
 a16-20020a62e210000000b004c91cff15ccmr2941028pfi.55.1643054285206; 
 Mon, 24 Jan 2022 11:58:05 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x18sm12866584pgj.41.2022.01.24.11.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 11:58:04 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V6 0/5] Use CCF to describe the UART baud rate clock
In-Reply-To: <cc3b971f-c630-4ce2-e6dd-c13bcba89d22@amlogic.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <7hfspjqrn7.fsf@baylibre.com>
 <cc3b971f-c630-4ce2-e6dd-c13bcba89d22@amlogic.com>
Date: Mon, 24 Jan 2022 11:58:04 -0800
Message-ID: <7hbl00ykhf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_115807_567487_736FFC9E 
X-CRM114-Status: GOOD (  20.64  )
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

Yu Tu <yu.tu@amlogic.com> writes:

> Hi Kevin,
> 	Thank you very much for your reply.
>
> On 2022/1/20 6:37, Kevin Hilman wrote:
>> [ EXTERNAL EMAIL ]
>> 
>> Hello,
>> 
>> Yu Tu <yu.tu@amlogic.com> writes:
>> 
>>> Using the common Clock code to describe the UART baud rate
>>> clock makes it easier for the UART driver to be compatible
>>> with the baud rate requirements of the UART IP on different
>>> meson chips. Add Meson S4 SoC compatible.
>> 
>> Could you describe how this was tested and on which SoCs?  There seem to
>> be some changes in this series that might affect previous SoCs.
>> 
> For me, the board starts normally and prints. My intention was to add 
> the S4 SOC UART compatible, but for the S4 our baud rate clock is 
> calculated at 12MHz by default.So a series of changes were made at your 
> suggestion.
>
> Since most SoCs are too old, I was able to find all the platforms myself 
> such as Meson6, Meson8, Meson8b, GXL and so on. I only tested it with 
> G12A and S4.But when I talked to Martin earlier he tried meson8b's log.
> The test patch is in the attachment.
>
> I have found that on some boards with this change, the initcall_debug 
> Uart driver takes longer to initialize. Running the stty command to 
> change the baud rate at the same time may cause a jam.

This kind of detail is important to document in the cover letter,
including a bit more detail on how to reproduce so that other can help
test or may have ideas for how to solve.

> I'd love to know what else you suggest.

I don't expect you to be able to test on all SoCs, but just to list what
SoCs and which boards you tested on.  This way, those who have other
boards can help test and we can have a better idea of how this was
tested before merging.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
