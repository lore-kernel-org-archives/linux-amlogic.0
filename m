Return-Path: <SRS0=KqJO=BG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E856C433E8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 07:29:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A43E2070B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jul 2020 07:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="phuYPL52";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RcFtDGx2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A43E2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=by/8hmSBS74miiei+UxL4rJNeG7tCsrq4w/eSwVI+F0=; b=phuYPL52BBXYgk2ORsli7MP08
	M9O1LPJvTEhfNiAuBlPJ7IfQOzPovswqPPdOizIpTtzaI3b8RtvddX8Ssa7nDwKexrcMLcmx5Pxpv
	XZ3gmdLLzBnJigjkdqEKKSqpJPA/zhUAboxfPQt7hR0N8oHnFRy6SRLmEGC2+larwMcN4sH/VyZPi
	+HY+erSX961kvZIjxtCVmb+FEr6R4vVgW0vfRPx3w7pU9033ffwnxSyYfDfVaVwHWNO/LgDSue1nv
	0b/66mrd4WAZ0RpIuWa8NnltfB90pWSR8BzJjw8PHr4fksdE7G3dkM3BWQWNuWJwj1ur6w4SVLnsW
	BtlqP+W5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxZ7-0001tS-2a; Mon, 27 Jul 2020 07:28:53 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxZ3-0001rR-E2
 for linux-amlogic@lists.infradead.org; Mon, 27 Jul 2020 07:28:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id k20so6017520wmi.5
 for <linux-amlogic@lists.infradead.org>; Mon, 27 Jul 2020 00:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=esRwbTCzDO7x2Eh5vxgXr51hblMhF7XMAdzGe185q58=;
 b=RcFtDGx2prygoi/goLympmWmMWrHgs+W+Mu8GWjpCcrcy5qljVybkEdf4FSqlvKvB5
 gFsyOki6z1CTxJB85UYVCV/xddThoGl56Gm+kIOMzsY8x+RR0QH8EQ+uC011LxY6y6DN
 FO1lP8Ne4sJg+kDhGugIRthqY6y7LCKhwmskh+k1GXjrhOCdEqiKdsUh7L+5nkJ0ke49
 rTq5PuDKFubDWBaXPdjJRE9lf7nPbwKv8uf3z/R6jsFIVndcLu8K11Cg2YaQ+fDmjTyZ
 8pBAd8vmo3eK/LCzxVW1LfhiVeU6EnNz5lS5ZmDxbz4HqpSEzrlxtmW6vDSn0/nCamL+
 5Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=esRwbTCzDO7x2Eh5vxgXr51hblMhF7XMAdzGe185q58=;
 b=DkH1wiMvl+wL3RJgfWm7RdFr7r8qQZYIg2TJr6stJ59OBUgB7O6VQjYVlybYuv4+q3
 dAgs2od63+gLq9kpqvLksfQ1kfKJdYKpn8SKgWz9d2uMhsiwR9pprbAGk//o2aD7IeEW
 J7x1mMGkYlc9Z7+Fl+OanjjLmdK4EN6RDfqV/IgwuHI6xvfFihBcHhn8RtLFeOklvVDy
 eq6N5NgT+xK882sk49JDdu+PmnqVOibEac2vl0Qf416TIAS0qJPjTfrtb/rHUE/2ru+o
 +8oBo/85KeegwuyGN6e6xOJlDCx7AQ3cai4VLHHEP0w4AhuehHcRB7PiDYX099G0RroU
 ujMw==
X-Gm-Message-State: AOAM53164jqsnnAS7fxtyJw9cBFmXmfH35jAVhA0GRTL6DdC4jFXkqQU
 ho+5qj3BAcyVNy0zSghZ7JUOHfYcBakoMw==
X-Google-Smtp-Source: ABdhPJwwFyXP9m/QKHlWEoJgeVi7242QOXUA6jx28eAS7kwNdU7yV7fLodxpOYPkpJ7kyPDLJVd3yg==
X-Received: by 2002:a1c:c256:: with SMTP id s83mr17451497wmf.17.1595834926293; 
 Mon, 27 Jul 2020 00:28:46 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:c02:85df:32ef:2826?
 ([2a01:e35:2ec0:82b0:c02:85df:32ef:2826])
 by smtp.gmail.com with ESMTPSA id y189sm19988868wmd.27.2020.07.27.00.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 00:28:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/fourcc: fix Amlogic Video Framebuffer Compression
 macro
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200723090551.27529-1-narmstrong@baylibre.com>
 <20200726172549.GH3275923@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <c056f317-c705-8356-e83b-ef3e206f4811@baylibre.com>
Date: Mon, 27 Jul 2020 09:28:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726172549.GH3275923@ravnborg.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_032849_630668_7B1FCFEB 
X-CRM114-Status: GOOD (  17.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 26/07/2020 19:25, Sam Ravnborg wrote:
> Hi Neil.
> 
> On Thu, Jul 23, 2020 at 11:05:50AM +0200, Neil Armstrong wrote:
>> Fix the Amlogic Video Framebuffer Compression modifier macro to
>> correctly add the layout options, a pair of parenthesis was missing.
>>
>> Fixes: d6528ec88309 ("drm/fourcc: Add modifier definitions for describing Amlogic Video Framebuffer Compression")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Looks correct just looking at the patch below.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I assume you will apply the patch.

Yes, indeed

Thanks !
Neil

> 
> 	Sam
> 
>> ---
>>  include/uapi/drm/drm_fourcc.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index 4bee7de5f306..82f327801267 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -1004,7 +1004,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>>  #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
>>  	fourcc_mod_code(AMLOGIC, \
>>  			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
>> -			((__options) & __fourcc_mod_amlogic_options_mask \
>> +			(((__options) & __fourcc_mod_amlogic_options_mask) \
>>  			 << __fourcc_mod_amlogic_options_shift))
>>  
>>  /* Amlogic FBC Layouts */
>> -- 
>> 2.22.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
