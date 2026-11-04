Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCCA606A334
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2026 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SgLHKFrd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lz+8VDAp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b0ecm3GjInOIWknQPD7UWmaSQ+YebNcW4nHm9L1NwXI=; b=SgLHKFrduScUxuDXTjWEShCFsS
	cvdrF31tVmePdzkIAdyZ6Gce7ROg9jVyjR6tr+Bkf4Fd4nejlI0N8w2aOyDZITC1aqjfBXQKr1zY6
	RIT0yn0u6iUVJkn9tcR7htTNAdyAOkzyVfIbyL5UlG/rSIl4zB74mbYQX4QHb1Zt3BbF4xcAYbgNO
	dpET7eIR7GOeXhacJTMd1yTf6uYRTtaoaVvkNOlBaGmR9fF0wIvru1HXGDOxpgbIBuyDJus+l1PFA
	FNwq/ebzB8vFJJ2FeCYUzYvKkfJY20+6ZkGMLP8vuy+6V8aAmUSok8SmKLXxkdabtN2ygDmezipe1
	ZBD2Rldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWhz-00000004mbh-183C;
	Wed, 04 Nov 2026 08:51:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWhp-00000004mU4-17OK
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Nov 2026 08:51:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso2252565e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2026 00:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782251; x=1794387051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uosKOFE+jLmcuWismvtv+9sAqcc+AKxPzq+cY150Wc=;
        b=lz+8VDApK58O0v9ER+PkGVyi+i3GFLch0pT0SfoBLlqy5sxA7BfR3T2cK76wAVUNxR
         U8f2FThMU6T6lb3+ClUr3199azMP2GJvo6IBgN2ZHCe1H2juO/8FyPUZwF35TOkmkSy1
         lDxxQwRQ7GAmDhdf8A2+AtWKxRZbdnQT4oNTEbtkiXDIRwxnumScRTnp1ns3HBFndCqe
         4hdfV+y8+HN+ctPNW2VqMi/7sCH9697XRdT2oVTIyemJoN+UpmyW7px7LpukcRHcziXi
         ZNW4TV8WaBtS06BDKNiBNFDh6lnG4HgDIKeI+8wfLxr0k6/AewBCXYOnkkLw+f58I50D
         bdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782251; x=1794387051;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uosKOFE+jLmcuWismvtv+9sAqcc+AKxPzq+cY150Wc=;
        b=QPAqL6FTb0upY3+E735Sxiz3w4solGHJMHre1qecTKEkRa9ExxFQVBCbYjLfKM5Ffz
         D+xXbYvy8DhEabfq6FUKoOEhQfa73o00XdTMAWxlZuAcxItnfDm8FdFkRA7dRe+iOzPX
         zGYtHW/O03ZndqzkAdrNDjHKNFLD4Zv+dVZOpwNWGVHQY8z8SzHLx/CIGaz9BnRgXb0C
         bQq9NUaeu8pl6EGYBMGLwhQrSRDC2orwIlSN/y0J2kndrtm/n0K231PxJAldMjBaN+Kw
         XcrRAsrYCJ99ofgfrT5H4PNqZCmK/F0hde4RQxCG1W6/jZkh+0B624I2Bgs4UEOoN/aT
         bbvw==
X-Forwarded-Encrypted: i=1; AKwUvBwXEQEncO0I8VxxIjmfblqQ42j/1xpkcJSGXxCRjd7cqdVVXF9E5gqoIozUwDQuDMedrGo09T4+q+QFM4Eg@lists.infradead.org
X-Gm-Message-State: APuU4Z9pX89ws4/riyonSy9Hl2yiFiliLUJAslpTGxRGsaovxMa0sJBD
	RQNMR0y1RhOk5zX2xIav1dCC94SgpeC3T8UZKhBmUjM/fnf1kuazQjV0FXwfd8d/gDA=
X-Gm-Gg: AYBFou1U3r8GEF2jc/fhB9eXTyIlQTOh3gDM8l0ua51aeOYq0WyxDT11o86QVL+cTXL
	np3iDqeo48CrrqKrc1D6HOZHDrH3W2nQULPPxB4CUNh8n18uPqC/G41GSc+fuy4U2qhMYa+G8Qq
	PDgEaW+aP/2cdiK4WsYPrA+Hzh4RBVWr7cvncLRRa/pn2rVFACAsIKATwqBXIluU3GvqZ/dPXTx
	wo0+l02MT3sg+OAB3bSWD7bJpQTwwhxDtt+WR6flT3t6+HJzFZlVnLHRL1pGGqf/vdu7FdwsskE
	Lgli+IhDwt/4/TlFikCa6sARMJldhhLIEBFqxOZ/sZyU7uMNUWU7HQiNo/l+SLSI6AkAg790HnP
	/bcFGBFI/MzrbI9QUCvApX0UtBP9mMSae6XGrPApkBFrWT5o1o5V6/Cl1Lfn1Gfek6OXdTvE+JC
	IK5PS1Jloit/tHqF05+RPo6vB6ywEol/QYMC50u9SUENb7brVaAjZuobyngwZuKhvP5YE7aDyfi
	2J1wS/ehBewTaGE4t51aLL8lIM1s7pcxZftqzdiVCA7n4Se6lpCL+d16YpMqpbqgTKipefN7gAI
	I8yq4RQB4Ulz7u7ph62jd2E0KKaI8EkGAnVq2FGAEPwWf6pfUM5ot69btSi29tt744BrYvDwqnz
	6Joi5tvXvhCaAQfki3p3VpniIstBVvQ==
X-Received: by 2002:a05:600c:4e8c:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4ac1793ff26mr345895375e9.15.1793782251064;
        Wed, 04 Nov 2026 00:50:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm2514434f8f.11.2026.11.04.00.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:50:50 -0800 (PST)
Message-ID: <399668f0-e97a-438e-b761-1ea6c18d904b@linaro.org>
Date: Wed, 4 Nov 2026 09:50:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 0/3] alarmtimer: Choose the wakeup RTC per sleep state
 from the device tree
To: iav@iav.lv, John Stultz <jstultz@google.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_005053_428085_8CD12A0C 
X-CRM114-Status: GOOD (  32.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/26 06:54, Igor Velkov via B4 Relay wrote:
> alarmtimer binds to the first registered RTC that has an alarm and a
> wakeup-capable parent and programs it on every suspend. On ODROID-HC4
> that RTC is amlogic,meson-vrtc: a register the SoC firmware reads when
> the application processors suspend. It wakes the board from deep sleep
> only, and only when the firmware handles the alarm; it raises no
> interrupt in Linux, so it never wakes the board from s2idle. The board's
> pcf8563, whose interrupt line goes to a GPIO, registers later and is
> never used.
> 
> Which RTC wakes the system depends on the sleep state and on the board's
> firmware, so the series lets the board device tree say it per RTC:
> 
> - linux,wakeup-states: the sleep states an alarm of this RTC wakes the
>    system from ("s2idle", "shallow", "deep" as in /sys/power/mem_sleep,
>    plus "hibernate" and "off"), or "none".
> - linux,alarmtimer-priority: a weight to pick among several RTCs that
>    wake the system from the same state.

This sounds bulky, perhaps it would be much simpler if we just added
all the available RTCs which has RTC_FEATURE_ALARM and can wakeup ?

Just switch from 1 single to multiple RTCs in a linked list and you're
done, no DT & bindings changes.

Neil

> 
> alarmtimer keeps each RTC that has an alarm and a wakeup-capable parent,
> unless an RTC registered before it, with at least the same priority,
> already wakes from every state it lists; each kept RTC gets its own
> "alarmtimer" platform device under the RTC. alarmtimer_suspend() picks,
> by pm_suspend_target_state, the RTC with the highest priority among
> those listing that state, the first registered among equals, and
> programs the alarm from that RTC's platform device only. The driver core
> suspends a device before its ancestors (dpm_suspend() takes
> dpm_prepared_list from the tail, in reverse registration order), so the
> chosen RTC and its parent, which drives the hardware, are still awake
> when the alarm is programmed.
> Without the properties only the first RTC gets a platform device and
> alarmtimer programs it on every suspend.
> 
> An RTC without linux,wakeup-states is taken to wake the system from
> every state, so that adding the property to one RTC, e.g. from an
> overlay, does not change how the others are used; a priority on the new
> one settles which wins.
> 
> Hibernation wakeups (.freeze/.poweroff callbacks) are not part of this
> series.
> 
> Patch 3 sets linux,wakeup-states on ODROID-HC4: "s2idle" for the
> pcf8563 and "deep" for meson-vrtc, so that alarmtimer programs the
> pcf8563 for s2idle and meson-vrtc for deep sleep. The patch applies to
> the current tree, but the s2idle wakeup also needs the pcf8563
> interrupt (GPIOX_5), which a patch under review adds [1].
> 
> Tested on ODROID-HC4 with v7.3.1, [1] and a BL301 that handles the vrtc
> alarm, waking by a CLOCK_BOOTTIME_ALARM timer, once per state: s2idle
> woke on the pcf8563 interrupt, deep sleep on meson-vrtc with the pcf8563
> alarm left unset. Without the series the alarm went to meson-vrtc and
> the board did not wake from s2idle.
> 
> Questions:
> 
> - Are "linux,wakeup-states" and "linux,alarmtimer-priority" acceptable
>    names, or should they be generic (no linux, prefix), given that the
>    states describe the hardware and the firmware rather than Linux?
> - Is the device tree the right place for a capability that depends on
>    the firmware the board runs? On HC4, meson-vrtc wakes from deep sleep
>    only with a BL301 that handles its alarm.
> 
> The alarm limit of meson-vrtc also depends on the firmware, and the
> kernel cannot learn it. Some API is needed to pass this information to
> the kernel.
> 
> [1] https://lore.kernel.org/r/20261020-hc4-rtc-alarm-irq-v1-1-b2b8c68d54f5@iav.lv
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Igor Velkov (3):
>        dt-bindings: rtc: Add linux,wakeup-states and linux,alarmtimer-priority
>        alarmtimer: Choose the wakeup RTC by sleep state and priority
>        arm64: dts: amlogic: meson-sm1-odroid-hc4: Describe which RTC wakes the board
> 
>   .../bindings/rtc/amlogic,meson-vrtc.yaml           |   3 +
>   .../devicetree/bindings/rtc/nxp,pcf8563.yaml       |   3 +
>   Documentation/devicetree/bindings/rtc/rtc.yaml     |  29 ++++
>   .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |   5 +
>   kernel/time/alarmtimer.c                           | 157 ++++++++++++++++++---
>   5 files changed, 180 insertions(+), 17 deletions(-)
> ---
> base-commit: 348f54c435bf3177baa78201952810b255d44b30
> change-id: 20261104-b4-alarmtimer-rtc-priority-2e25131a2917
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
