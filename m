Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15307C52D7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2024 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DC6oYwX8V5RrLOiuBsctCcaVuVyKH5X5kC/f6SZbny0=; b=quQ+dLBS+5k8qf
	pCqNVO6fII+Lvxk9lqhd+legBABluY2/Gje/VXoh/81PYF0YoAOPbNe14OiQCwOpzgOXofJV5a/tD
	RjbOO6JMW/GZq7dPH6g+epE/Z8cFsieISnsJpVyyQYICrtxOirKF/dytb8GtdkJPObvRwbj/FPCFj
	Tot+pN85GvliE79DO8uMpKCW9yc42TNPH2v4L/G+3a9Hzs4Ytq4lGUaAdP8EAnC2bJyqv8+48guYV
	dILltfdabcleSW85nWo+EmAr2z7X3eQnrStr8um+tX10JrCZHKGX6kQm+gDKcNhKsMBciXgLtywkL
	2HE6OzCTbVNrW9BryNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7Mp-0000000Cpb4-104p;
	Thu, 22 Aug 2024 12:56:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7Mk-0000000CpZq-1ncL
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Aug 2024 12:56:40 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3719f0758c6so401172f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2024 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724331396; x=1724936196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NI5LFlNxsloHO/MXLodkDWQJ7BpVf9SBIBu3OZTDp0=;
        b=Hdkm0TSkY05y22/dbmwzegyYCPWFJAIdzpO5uYvo3k/CrOZh7666yOdkiBEAtbXDB0
         2rj4+Vj5/CwzpDI2E/5MQbq8KCv2FfvxeHzUjANTeFUL/++iXa1wM5L+0xwG/SoE1Qhg
         l91Hdyam1ThdRoRk4qgzwyTE585brlKme9IJ7YAj8e4dkk0w/M5AqoCkRS5W2GPpUVHt
         +JqDOeDUOeBjacYgnwDzwhochUQcI9mhaiZE9FlH/DaIGifXVy5NjZq4AsYeWIsXnO24
         1l2DVNUvonQafz1MZKr59FkXlSpn/P/w9J1JOTsGkV4h9SccZ4piTZ3I+SO0G4akA5Qk
         HMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724331396; x=1724936196;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2NI5LFlNxsloHO/MXLodkDWQJ7BpVf9SBIBu3OZTDp0=;
        b=q1HwFTCUWwcfgjp6hcnyF2VQiaC9bryWmJSYtjjsvPw0PCVKSsgBaGuYG01Zm7ikGX
         O+5PYQJZrN5UelotkNOlUaVtMSd9nMt9kNXbRAvZwq07PFJkaDEBatvEC5XEHdX8HPNk
         ehQfKxRBFERm1PguCb449knOTNlmdoasLgKlsfP6nfIQwFq1LzwpkJsuSL+EG4vMqYiL
         46mlVm38W299i9EZrxBUhW+EHEVkK8V+E0h6umxhmE/pK3wBYMHVhEPwbcn9YqSBUeIr
         k6XSMBAsHrwA3TBwrKrYF29M2jn1lz/GyvRlSX9s47QlEqA4EteOiZpSFrO4N/daoWka
         VykQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9Bs+IEoF5rjwD6nOOYvsGgwUOa6ad2rbOBRKJxDpThffBlOdYiGfrGFDVWGAfAl0RCvaGq+3Di0OE9/7P@lists.infradead.org
X-Gm-Message-State: AOJu0YyyRQ4EBsUSunMOJDVZJDDZEqG6iJ/N/nxToEptC3xoEHtYEJNK
	2WQGwc3hSkFlKV7x2VV0b1eWHTAuzY0ZLu/7JTFbrRTo0/MV+kGjJRp6STGAcDs=
X-Google-Smtp-Source: AGHT+IH7Npize1/MPoSbHq38Pg4ilRoun8TonDorBUmkSbOd4DbVQXUFq81/s+M6Mld9Z4V2DcuVXw==
X-Received: by 2002:adf:e60a:0:b0:371:87d4:8f12 with SMTP id ffacd0b85a97d-372fd58cf57mr3585916f8f.17.1724331395960;
        Thu, 22 Aug 2024 05:56:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f06:7793:d95e:24b? ([2a01:e0a:982:cbb0:f06:7793:d95e:24b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815c035sm1624377f8f.55.2024.08.22.05.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 05:56:35 -0700 (PDT)
Message-ID: <91ed1523-faeb-4e04-8000-c411dba5a542@linaro.org>
Date: Thu, 22 Aug 2024 14:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20240822: rcu: Unless rcu_preempt kthread gets sufficient
 CPU time, OOM is now expected behavior.
To: Naresh Kamboju <naresh.kamboju@linaro.org>, rcu <rcu@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Mark Brown
 <broonie@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <CA+G9fYvZAUOKhf+Yg6J=OUxnJ0ckv4jxyDLGyKsqwUpAak84hw@mail.gmail.com>
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <CA+G9fYvZAUOKhf+Yg6J=OUxnJ0ckv4jxyDLGyKsqwUpAak84hw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_055638_675773_843FD8CE 
X-CRM114-Status: GOOD (  12.71  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 22/08/2024 13:16, Naresh Kamboju wrote:
> The following kernel crash was noticed on arm64 Rock-pi 4b,
> Qcomm dragonboard 410c and 845c devices while booting / loading kernel modules
> on today's Linux next-20240822.

I see the same crash log on the following devices built with next-20240822 and ARM64 defconfig:
- Libre Computer AML-S805X-AC (Amlogic S805X)
- BananaPi M2S (Amlogic A311D)
- Snapdragon DB410c
- Qcom SM8250-HDK

I do not see the same crash log, but the following board fails to complete boot:
- Banana Pi BPI-M5 (Amlogic S905X3)
- Libre Computer AML-S905X-CC (Amlogic S905X)
- Qcom SM8150-HDK
- Qcom DB845c
- Qcom SM8350-HDK
- Qcom SM8450-HDK
- Qcom SM8550-HDK
- Qcom SM8550-QRD
- Qcom SM8650-HDK
- Qcom SM8650-QRD

Neil

> 
> First seen on next-20240822.
>    Good: next-20240821
>    BAD:  next-20240822
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> We are bisecting this problem.
> 
> Crash log:
> --------
> [    0.000000] Linux version 6.11.0-rc4-next-20240822
> (tuxmake@tuxmake) (Debian clang version 18.1.8
> (++20240731024919+3b5b5c1ec4a3-1~exp1~20240731145017.142), Debian LLD
> 18.1.8) #1 SMP PREEMPT @1724309008
> [    0.000000] KASLR disabled due to lack of seed
> [    0.000000] Machine model: Radxa ROCK Pi 4B
> ...
> [   16.923808] coresight-cpu-debug fe430000.debug: Coresight
> debug-CPU0 initialized
> [   16.933919] coresight-cpu-debug fe432000.debug: Coresight
> debug-CPU1 initialized
> [   16.935653] coresight-cpu-debug fe434000.debug: Coresight
> debug-CPU2 initialized
> [   16.937846] coresight-cpu-debug fe436000.debug: Coresight
> debug-CPU3 initialized
> [   16.939744] coresight-cpu-debug fe610000.debug: Coresight
> debug-CPU4 initialized
> [   16.942132] coresight-cpu-debug fe710000.debug: Coresight
> debug-CPU5 initialized
> [   37.987966] rcu: INFO: rcu_preempt self-detected stall on CPU
> [   37.989037] rcu: 2-...!: (5248 ticks this GP)
> idle=d1f4/1/0x4000000000000000 softirq=1552/1553 fqs=0
> [   37.990715] rcu: (t=5250 jiffies g=1269 q=784 ncpus=6)
> [   37.991667] rcu: rcu_preempt kthread timer wakeup didn't happen for
> 5249 jiffies! g1269 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> [   37.993718] rcu: Possible timer handling issue on cpu=4 timer-softirq=296
> [   37.994966] rcu: rcu_preempt kthread starved for 5250 jiffies!
> g1269 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=4
> [   37.996844] rcu: Unless rcu_preempt kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [   37.998499] rcu: RCU grace-period kthread stack dump:
> [   37.999419] task:rcu_preempt     state:I stack:0     pid:18
> tgid:18    ppid:2      flags:0x00000008
> [   38.001117] Call trace:
> [   38.001565]  __switch_to+0x15c/0x208
> [   38.002229]  __schedule+0x54c/0x9d0
> [   38.002870]  schedule+0x12c/0x1e0
> [   38.003479]  schedule_timeout+0x9c/0x1b0
> [   38.004202]  rcu_gp_fqs_loop+0x1e0/0x880
> [   38.004926]  rcu_gp_kthread+0x70/0x230
> [   38.005616]  kthread+0x104/0x198
> [   38.006209]  ret_from_fork+0x10/0x20
> [   38.006877] CPU: 2 UID: 0 PID: 237 Comm: (udev-worker) Not tainted
> 6.11.0-rc4-next-20240822 #1
> [   38.008442] Hardware name: Radxa ROCK Pi 4B (DT)
> [   38.009284] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   38.010551] pc : smp_call_function_many_cond+0x468/0x6b8
> [   38.011521] lr : smp_call_function_many_cond+0x428/0x6b8
> [   38.012490] sp : ffff800083d1bb50
> [   38.013094] x29: ffff800083d1bb90 x28: 0000000000000006 x27: 0000000000000000
> [   38.014399] x26: ffff80008269e000 x25: 0000000000000000 x24: 0000000000000001
> [   38.015702] x23: ffff8000801bc470 x22: ffff800074e75000 x21: ffff0000f74d8c20
> [   38.017005] x20: ffff0000f746cb80 x19: ffff8000826a3470 x18: ffff80007afc2000
> [   38.018308] x17: 000000000909008e x16: 0000000000000000 x15: ffff8000816092a0
> [   38.019611] x14: 060a090000000000 x13: 0000000000000003 x12: 000000000000003f
> [   38.020914] x11: 0000000000000001 x10: 0000000000000000 x9 : 0000000000000011
> [   38.022218] x8 : ffff0000f74b6c28 x7 : 0000000000000000 x6 : 0000000000000080
> [   38.023520] x5 : 000000000000003f x4 : 0000000000000000 x3 : 0000000000000006
> [   38.024823] x2 : 0000000000000004 x1 : 0000000000000004 x0 : 0000000000000004
> [   38.026126] Call trace:
> [   38.026574]  smp_call_function_many_cond+0x468/0x6b8
> [   38.027481]  kick_all_cpus_sync+0x44/0x78
> [   38.028216]  flush_module_icache+0x38/0xe0
> [   38.028965]  load_module+0x1374/0x1778
> [   38.029654]  __arm64_sys_finit_module+0x238/0x348
> [   38.030516]  invoke_syscall+0x4c/0x110
> [   38.031207]  el0_svc_common+0x8c/0xf0
> [   38.031880]  do_el0_svc+0x28/0x40
> [   38.032490]  el0_svc+0x40/0x88
> [   38.033054]  el0t_64_sync_handler+0x90/0x100
> [   38.033837]  el0t_64_sync+0x190/0x198
> [   38.034509] Sending NMI from CPU 2 to CPUs 4:
> [   48.036555] Sending NMI from CPU 2 to CPUs 5:
> [   78.247966] sched: DL replenish lagged too much
> [  121.047963] rcu: INFO: rcu_preempt self-detected stall on CPU
> [  121.049009] rcu: 2-...!: (21002 ticks this GP)
> idle=d1f4/1/0x4000000000000000 softirq=1552/1553 fqs=0
> [  121.050702] rcu: (t=26015 jiffies g=1269 q=784 ncpus=6)
> [  121.051669] rcu: rcu_preempt kthread timer wakeup didn't happen for
> 26014 jiffies! g1269 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x200
> [  121.053735] rcu: Possible timer handling issue on cpu=4 timer-softirq=296
> [  121.054982] rcu: rcu_preempt kthread starved for 26015 jiffies!
> g1269 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=4
> [  121.056876] rcu: Unless rcu_preempt kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [  121.058530] rcu: RCU grace-period kthread stack dump:
> [  121.059447] task:rcu_preempt     state:R stack:0     pid:18
> tgid:18    ppid:2      flags:0x00000008
> [  121.061140] Call trace:
> [  121.061587]  __switch_to+0x15c/0x208
> [  121.062245]  __schedule+0x54c/0x9d0
> [  121.062885]  schedule+0x12c/0x1e0
> [  121.063494]  schedule_timeout+0x9c/0x1b0
> [  121.064214]  rcu_gp_fqs_loop+0x1e0/0x880
> [  121.064936]  rcu_gp_kthread+0x70/0x230
> [  121.065625]  kthread+0x104/0x198
> [  121.066217]  ret_from_fork+0x10/0x20
> [  121.066874] CPU: 2 UID: 0 PID: 237 Comm: (udev-worker) Not tainted
> 6.11.0-rc4-next-20240822 #1
> ...
> [  785.590550] Sending NMI from CPU 2 to CPUs 4:
> [  795.592594] Sending NMI from CPU 2 to CPUs 5:
> 
> boot Log links,
> --------
>   - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240822/testrun/24939658/suite/boot/test/clang-18-lkftconfig/log
>   - https://lkft.validation.linaro.org/scheduler/job/7816099#L523
>   - https://lkft.validation.linaro.org/scheduler/job/7815910#L2448
> 
> Boot failed comparison:
>   - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240822/testrun/24939658/suite/boot/test/clang-18-lkftconfig/history/
> 
> metadata:
> ----
>    git describe: next-20240822
>    git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>    git sha: 6a7917c89f219f09b1d88d09f376000914a52763
>    kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2l0EZh4ZCNgUovHichD9yUraMrY/config
>    kernel version: 6.11.0-rc4
>    artifact location:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2l0EZh4ZCNgUovHichD9yUraMrY/
>    build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2l0EZh4ZCNgUovHichD9yUraMrY/
>    toolchain: clang-18 and gcc-13
> 
> Steps to reproduce:
> ---------
>   - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2l0EbxmBUpGzF37iIJ51WvkJFt8/reproducer
>   - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2l0EbxmBUpGzF37iIJ51WvkJFt8/tux_plan
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
