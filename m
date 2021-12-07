Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E54C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Dec 2021 11:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2duVF1evdZQhBPbOstqYxvCV//t1VHLamzIrtuEQX5I=; b=FWJ5gdRTd1wD01UCtGldgUsV3z
	18ektm7fuPUO8XufZQRq1wJqzd/qPvVQGZ9Fh6vXIzcE99b/iI6LBchFJyj+sbqfXoPVo5ToD4KW3
	0r+2281yfPWlVbE54s2fEYt+O9zgKfxNzRHl1PA+7tzoyteeE2txwHTQnlj4banOyEoTLrPXsfHtu
	uvIcwi/DpvAcMRUoUzs5njOU0gDeyfzdpwDLkF3RXkgZoh3eTA0kueEwv3fxJ7xJlnYUF4uep/eXk
	4/nLKZ0iED8NvrUv3aTirR1WEgEs2c4hZEd1rHiQj5gvkS0mX0g9JdHa53vDQa0RepwMMHSlgmxOv
	xRv3xi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muYWq-008FZP-Kj; Tue, 07 Dec 2021 11:21:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muYWm-008FYH-Oj
 for linux-amlogic@lists.infradead.org; Tue, 07 Dec 2021 11:20:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id a9so28684709wrr.8
 for <linux-amlogic@lists.infradead.org>; Tue, 07 Dec 2021 03:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7SnhNwByiawTTcw1MP4TZPPrzNaWp5dA9zL+41P8YmE=;
 b=ZPaXypHqqQIK8shTaoa+pgZJVWsa6Vpw3WiVp0PVa7RClYDHyW7fjzpbeV/FEz2q9y
 sJ1lw3jAD1eMOE6PGIRx53FuNOZKzSZGIDJu5jrqjQm2Dvx+sgGNxAKbv3XmqhNMZ8lj
 gvTJYt7FIaYuLUhk+hjEDJfLT/EGCbzEgzmvBP+lR3IIR1VP0QaP/cfpmYJpET/AbhkI
 zRtopceXWs+j5tAYYaplTzYj9gzcFi4/X5wJLFk7fhtbP/DZb4iHHzm1srQnU6dkADNL
 lXnzMmQQC+jm8g0PNu9PwEGfcvBMalK6Ou/2abOGn1Zn1SdP7b8qFfV+wQE0MtaNDoLh
 0b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7SnhNwByiawTTcw1MP4TZPPrzNaWp5dA9zL+41P8YmE=;
 b=HzzwwV5GEqxVfA6rw3QMT2/nLzJh5/PQuwq0xZJLfcXqiaD+JV/jr3Xljvh35FdscK
 Rq+VXn5qSrYYfJtaEqWdNE1IXS3KAXHaVKztAkxXznwhJVN1zM8CK52ZYmAurPHeHUyC
 vx4CU4yVDbtrTJkXhkCcZcCu8HsZjXdDMvdNdxsBfNDybk69SKLMMsOKmYX9q9M2Td/a
 ao9WsVH1vXUAYr5rsKdQprfX2zSBD3MgNFHriUzaDaMSaO3E2CWu/qzAShlOLN49YGQ2
 6q0FZFZUaph1jCIDr4iDaCuqDfovuMZxZ3C0BjHu2plyJeyl+TNdcIa3zsrVtN/V1ppS
 1xMg==
X-Gm-Message-State: AOAM531Zy0K9iF7WSsXpJVUk81h5RVx7PlsGlV7hiGvHm+PimdykX54K
 6jOpnHGZfbjI8atyMs+SASABGDWlVMT3jkOn
X-Google-Smtp-Source: ABdhPJzV1KU4uSd4ulFMhhQmpYjFf8+HOXv8bLaVUlLoysp/amdEohmwMiaZLIOsnY1xXY1b7YhJqw==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr52092601wrd.105.1638876054507; 
 Tue, 07 Dec 2021 03:20:54 -0800 (PST)
Received: from [192.168.196.27] (46.172.185.81.rev.sfr.net. [81.185.172.46])
 by smtp.gmail.com with ESMTPSA id o12sm2600823wmq.12.2021.12.07.03.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:20:53 -0800 (PST)
Subject: Re: [PATCH v4 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 p.zabel@pengutronix.de
Cc: khilman@baylibre.com, balbi@kernel.org, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20211205215846.153703-1-aouledameur@baylibre.com>
 <20211205215846.153703-2-aouledameur@baylibre.com>
 <CAFBinCDZ2nTg2V_6qxok_y+wXHTVJ6XyyvON59TLJZ9B3fKY3Q@mail.gmail.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <23fd1b50-75e9-25fe-cff1-b25e4f472f8c@baylibre.com>
Date: Tue, 7 Dec 2021 12:20:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCDZ2nTg2V_6qxok_y+wXHTVJ6XyyvON59TLJZ9B3fKY3Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_032056_914573_1A38A92B 
X-CRM114-Status: GOOD (  19.67  )
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

Hi Martin,

Thank you for the thorough review.


On 06/12/2021 22:19, Martin Blumenstingl wrote:
> Hi Amjad,
>
> On Sun, Dec 5, 2021 at 10:59 PM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
>> Use reset_control_rearm() call if an error occurs in case
>> phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
>> phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
>> and the reset line may be triggered again by other devices.
>>
>> reset_control_rearm() keeps use of triggered_count sane in the reset
>> framework. Therefore, use of reset_control_reset() on shared reset line
>> should be balanced with reset_control_rearm().
>>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> changes since v3:
>> - Remove unnecessary reset_control_rearm() after reset_control_reset()
>> failure.
> I double-checked your patch in v3 and Philipp was right:
> reset_control_rearm() should not be right after reset_control_reset().
> However, I think reset_control_rearm() is still needed
> phy_meson_gxl_usb2_init() whenever clk_prepare_enable() fails.

Well seen, reset_control_rearm() should actually be called after

clk_prepare_enable() fails. I will wait for any other potential reviews

before sending next version with this change you suggested.


Thank you Martin.

Amjad

> So my suggestion is to add reset_control_rearm() in
> phy_meson_gxl_usb2_init() if clk_prepare_enable() fails so we are
> resetting the ref-count for the reset line (just like
> phy_meson_gxl_usb2_exit() does).
> The difference compared to the previous version is that the
> reset_control_rearm() call needs to be placed a few lines down.
>
>
> Thank you!
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
