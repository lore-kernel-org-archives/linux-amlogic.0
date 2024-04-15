Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D49C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2024 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrDtaHQLZZUrBQZYbk/a+6a6UuUlr8vEQpAerCwWNdI=; b=ZrtMvQ70sC33MC
	ejdLDldiOT6evkQ+mlXiYsMrHl0qcDaqFASHV0i+jdjQ2OMGSbeD+iYilcTS/dnjLZVX0akDiuPNJ
	dljM1B/Tk2EynWYeMFpTOUihBlE2F4rFYvITY6/DpRsBJO60y7NIbIoK0O0um+1qZBEaCsSR2+xd9
	yUjx7C1GX9e04PKo+jJC3bZrUEQqCcha7P7TSdYZFH04aiiQswhLrG/lTNkNUGTqMwfA/YhQIFqCL
	EvYZZaezS6k75hZ8gwIAK0jJhPog1bJ//c1+VHnuSIvQmA4C5Jy9uFxCOEia/ePTi217KkzeNgzf3
	wreSmyfzH1fyoGx0+CRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMOB-00000008TYF-3PPX;
	Mon, 15 Apr 2024 13:28:51 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMO9-00000008TXK-13sU
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Apr 2024 13:28:50 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34782453ffdso1444217f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Apr 2024 06:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713187726; x=1713792526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lrgrGzjjgYNJJjfx46YZRyvfOQXPcVBXxjVFNNCm2M=;
        b=ZmbCf8JNP1IA79nxV0QWf7l66vEakA+ehNLiBcMsQUAH2xT4jHlWyO3auBi6L8g9sL
         7cG7I2hEjJC1TWCc1ShkZLD0IpJeX8yw6DwklW22NM+163Qlle8SjgAwiPi4293NaURI
         T6rRMl7QqzjkVnN5jdG0MehW4AkOxMsvCp6lmu08Wu06XVfKu/x4tH9Qd3RiN27qkvAY
         vCqWAX0Zp0UrzMYpWGJMgwGj+WEF9T94xtbgH3omjUBjJ8Lfy6KCOoF61GFcvn1i7NVU
         SdmWt+Xu1vSiLfOKr+ygHn94AvWAu7tnPaPQKnX2SM614vQIlImDa0Rrn9pK6x3JBFPO
         8qbw==
X-Forwarded-Encrypted: i=1; AJvYcCXln5/WiAWToges9R/hfM1hOF2HOX36NIeMjOHlkKa668DZzO5NbebP8FdHG2918WqYNN+loTAD/+HcAppzm7bPffSoRC/71E/2r6iv0TaN1IQ=
X-Gm-Message-State: AOJu0Yzl9bmW6sqrCB9SnWGyUPsc80VYee2IEW5WumTS5ehmSulpn68P
	2yMGzRH251webzyt6ABYho0bMSiBUWtNjssuhkRqDhIgwAcqpCBE
X-Google-Smtp-Source: AGHT+IEnVEco3CbkMrPnlNwXMvP9q4ttl9SGzT8tNl6Ytwu7CS/s3vEsYwkX2DFq4d51oKk++f2Lzw==
X-Received: by 2002:a5d:64e3:0:b0:346:4151:12c4 with SMTP id g3-20020a5d64e3000000b00346415112c4mr11291238wri.10.1713187726032;
        Mon, 15 Apr 2024 06:28:46 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id t7-20020adfe447000000b00343eac2acc4sm12148705wrm.111.2024.04.15.06.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 06:28:44 -0700 (PDT)
Message-ID: <d70049d5-d0fe-465f-a558-45b6785f6014@kernel.org>
Date: Mon, 15 Apr 2024 15:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] tty: serial: switch from circ_buf to kfifo
To: Marek Szyprowski <m.szyprowski@samsung.com>, gregkh@linuxfoundation.org,
 linux-amlogic@lists.infradead.org,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20240405060826.2521-1-jirislaby@kernel.org>
 <20240405060826.2521-13-jirislaby@kernel.org>
 <CGME20240415125847eucas1p2bc180c35f40f9c490c713679871af9ae@eucas1p2.samsung.com>
 <91ac609b-0fae-4856-a2a6-636908d7ad3c@samsung.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <91ac609b-0fae-4856-a2a6-636908d7ad3c@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_062849_328499_D922B064 
X-CRM114-Status: GOOD (  14.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 15. 04. 24, 14:58, Marek Szyprowski wrote:
> Dear All,
> 
> On 05.04.2024 08:08, Jiri Slaby (SUSE) wrote:
>> Switch from struct circ_buf to proper kfifo. kfifo provides much better
>> API, esp. when wrap-around of the buffer needs to be taken into account.
>> Look at pl011_dma_tx_refill() or cpm_uart_tx_pump() changes for example.
>>
>> Kfifo API can also fill in scatter-gather DMA structures, so it easier
>> for that use case too. Look at lpuart_dma_tx() for example. Note that
>> not all drivers can be converted to that (like atmel_serial), they
>> handle DMA specially.
>>
>> Note that usb-serial uses kfifo for TX for ages.
>>
>> omap needed a bit more care as it needs to put a char into FIFO to start
>> the DMA transfer when OMAP_DMA_TX_KICK is set. In that case, we have to
>> do kfifo_dma_out_prepare twice: once to find out the tx_size (to find
>> out if it is worths to do DMA at all -- size >= 4), the second time for
>> the actual transfer.
>>
>> All traces of circ_buf are removed from serial_core.h (and its struct
>> uart_state).
>>
>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
>> ...
> 
> This patch landed in linux-next as commit 1788cf6a91d9 ("tty: serial:
> switch from circ_buf to kfifo"). Unfortunately it breaks UART operation
> on thr Amlogic Meson based boards (drivers/tty/serial/meson_uart.c
> driver) and Qualcomm RB5 board (drivers/tty/serial/qcom_geni_serial.c).
> Once the init process is started, a complete garbage is printed to the
> serial console. Here is an example how it looks:

Oh my!

Both drivers move the tail using both kfifo and uart_xmit_advance() 
interfaces. Bah. Does it help to remove that uart_xmit_advance() for 
both of them? (TX stats will be broken.)

Users of uart_port_tx() are not affected.

This is my fault when merging uart_xmit_advance() with this series.

thanks,
-- 
js
suse labs


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
