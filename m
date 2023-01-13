Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E750FC54EBE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhaDgQKnWaJDbYQQoeL1BRJyF3kyxHVQwvKHWDMmFDE=; b=BjYjYK7AdsJvWQ
	nvKNmY/Uv9kIGkJXJ2K49/mqu/LMyFXUsfCeoCzTbFUcvshYxYc9VfLxY9u9F9iR2whXrqRhaFZYF
	LsQHIdlsSS9SkKnqrrjT4e78qggZMWLeeEXtTPiTqnVoNwyTdw9j4OHaliq8/azVTQNxlvUy7GVIn
	oConlBj9RV1iSsstuHAoAbpOpDL62DpQny6bWLOpT1aHrs8rwGJWmLVUI1sYU/2XSefCtxGvcYoE/
	gTD/8LtLu2yVCSCr2s9LPnnOakhZD/Ej71HwUPgGP3mFzn922DUTZwgJTLH6Skovov5Mhuf6IWGL4
	ADH/Z0nzZgwkucjJZSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGH07-001h4m-NV; Fri, 13 Jan 2023 10:09:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGH03-001h1I-7t
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 10:09:29 +0000
Received: from [192.168.1.27] (cst-prg-44-69.cust.vodafone.cz [46.135.44.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: tomeu)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C275E6602DD3;
	Fri, 13 Jan 2023 10:09:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673604563;
	bh=ND7UBCuzabrZ7FxKgHFj7rRDyIOVsHf6BJW1VrI8FGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DOHjxYei+UMpn5glCgIATNwZJFvFBesdXIYLc7mPplQkGehT1ck/dalOcfNwRGEq6
	 ra+hsUt2VYMhIAsdN40vjzyiysmXWV7ecFBAqD8tiAjffWJJElScX3azRnaBMOL7hD
	 yKpaAHejBApdXUwwXsnbRKDOdmY4WNoQQptYS94/TYEx5uAeKHj2DjP+Rq0XBi0lCX
	 jVr1ie80TU04wu7FOUzcaNGcxMNoS8H8q5W/Qw9P+B8AUB3ezTwks7ifYcF1S0vdPC
	 f8whUEMSThA/txs4SduhJI21WHiPy2IeMRL0IhD2UDyLjVYW/Za/Vao0RZAmqEI94N
	 5Dx/b3/w5deoA==
Message-ID: <b553856a-9f9d-1ca3-7de8-68c1d5d691e6@collabora.com>
Date: Fri, 13 Jan 2023 11:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: failed to start gnome/gdm3 wayland session after apply NPU
 patches
Content-Language: en-US
To: Zhang Ning <zhangn1985@outlook.com>
Cc: linux-amlogic@lists.infradead.org
References: <OS0P286MB0641E5D5C1CF9D1E100EFFB6CDED9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
 <c8322c28-656a-64cc-58fe-668026723821@collabora.com>
 <OS0P286MB0641D37F1C6DE383018A3F9CCDF99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <OS0P286MB0641D37F1C6DE383018A3F9CCDF99@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_020927_682539_CE35B5AC 
X-CRM114-Status: GOOD (  16.11  )
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

On 1/8/23 03:32, Zhang Ning wrote:
> On Tue, Jan 03, 2023 at 03:46:00PM +0100, Tomeu Vizoso wrote:
>> Hi Ning,
>>
>> On 12/27/22 05:21, Zhang Ning wrote:
>>> Hi, Tomeu
>>>
>>> after apply your NPU patches:
>>> http://lists.infradead.org/pipermail/linux-amlogic/2022-December/014428.html
>>>
>>> VIM3 failed to start gnome/gdm3 wayland session.
>>>
>>> before:
>>>
>>> VIM3:~$ ls /dev/dri/by-path/ -l
>>> total 0
>>> lrwxrwxrwx 1 root root  8 Dec 27 04:06 platform-ff900000.vpu-card -> ../card0
>>> lrwxrwxrwx 1 root root  8 Dec 27 04:06 platform-ffe40000.gpu-card -> ../card1
>>> lrwxrwxrwx 1 root root 13 Dec 27 04:06 platform-ffe40000.gpu-render -> ../renderD128
>>>
>>> after:
>>>
>>> VIM3:~$ ls /dev/dri/by-path/ -l
>>> total 0
>>> lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-etnaviv-card -> ../card0
>>> lrwxrwxrwx 1 root root 13 Dec 27 04:10 platform-etnaviv-render -> ../renderD128
>>> lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-ff900000.vpu-card -> ../card1
>>> lrwxrwxrwx 1 root root  8 Dec 27 04:10 platform-ffe40000.gpu-card -> ../card2
>>> lrwxrwxrwx 1 root root 13 Dec 27 04:10 platform-ffe40000.gpu-render -> ../renderD129
>>>
>>> the fail log:
>>> Dec 27 04:10:42 VIM3 gnome-shell[673]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
>>> Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to open gpu '/dev/dri/card0': No suitable mode setting backend found
>>> Dec 27 04:10:42 VIM3 gnome-shell[673]: Added device '/dev/dri/card1' (meson) using atomic mode setting.
>>> Dec 27 04:10:42 VIM3 gnome-shell[673]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
>>> Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to open gpu '/dev/dri/card2': No suitable mode setting backend found
>>> Dec 27 04:10:42 VIM3 gnome-shell[673]: Failed to initialize accelerated iGPU/dGPU framebuffer sharing: No matching EGL configs
>>> Dec 27 04:10:42 VIM3 gnome-shell[673]: Created gbm renderer for '/dev/dri/card1'
>>> Dec 27 04:10:42 VIM3 gnome-shell[673]: Integrated GPU /dev/dri/card1 selected as primary
>>>
>>> how to configure system to boot to gui with npu enabled?
>>
>> Maybe you can do that by setting the "mutter-device-preferred-primary"
>> udev tag for card2?
>>
>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1562
> 
> Hi, Tomeu
> 
> I have tried this method.
> cat /usr/lib/udev/rules.d/61-mutter-primary-gpu.rules
> ENV{DEVNAME}=="/dev/dri/card0", TAG+="mutter-device-ignore"
> ENV{DEVNAME}=="/dev/dri/renderD128", TAG+="mutter-device-ignore"
> 
> and it does ignore card0
> Jan 08 02:19:06 VIM3 gnome-shell[681]: Ignoring DRM device '/dev/dri/card0'
> 
> but the screen still show nothing.
> and when I move mouse,
> 
> ning@VIM3:~$ cat /proc/interrupts |grep -e npu -e panfrost
>   16:       1088          0          0          0          0          0     GICv2 179 Level     ff100000.npu
>   39:         24          0          0          0          0          0     GICv2 192 Level     panfrost-gpu
>   40:          0          0          0          0          0          0     GICv2 193 Level     panfrost-mmu
>   41:          0          0          0          0          0          0     GICv2 194 Level     panfrost-job
> ning@VIM3:~$ cat /proc/interrupts |grep -e npu -e panfrost
>   16:       1100          0          0          0          0          0     GICv2 179 Level     ff100000.npu
>   39:         24          0          0          0          0          0     GICv2 192 Level     panfrost-gpu
>   40:          0          0          0          0          0          0     GICv2 193 Level     panfrost-mmu
>   41:          0          0          0          0          0          0     GICv2 194 Level     panfrost-job
> 
> 
> it looks like gnome-shell still using npu as render.
> 
> mutter-device-preferred-primary has same result.

I'm out of ideas, TBH. I think gnome-shell should realize that a EGL 
context cannot be created for the render node for the NPU and try the 
next device.

Maybe file a bug for gnome-shell?

Cheers,

Tomeu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
