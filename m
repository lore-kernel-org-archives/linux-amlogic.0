Return-Path: <SRS0=jorr=AZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9072C433E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2020 06:57:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 943BF221ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2020 06:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LabWDD0S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Donu1wjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 943BF221ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wSwcpikkSRpq1ipuJn8fN7NGyNp/HVDV52bWnUTzfsw=; b=LabWDD0SbGohdcrrIDDm/K5+b
	tz2Nbu+G5Bq09zuquXPG4bGSfn1sxfTOtckwD+ySdGVmh65cSqCYkrGePckSEhwANshbRdVoHF+uT
	JO6esX4fNwU0Ouea0W5yuTkWsN5SB6LJrK7140V2Z0SzWvMDwWDcoK8cFdRVBBSPb/GRQhXTFSBKd
	sPSEuUxzFbbqnsUJ1RJD0UI3AWTFIkpFgtdbzUacyzn6G36fVQRqVoGsUhPP/539KKRLuOK+8+A7y
	9gXUjIHeBIXGfV4WxXuJYseG/feIqNmGrcLkAxAGrqhhRgm9tglOa3rtqURUWOsTV/daqetQuBEUJ
	SQ/E0RW6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvEsL-00075h-Hz; Tue, 14 Jul 2020 06:57:13 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvEsI-000751-Vu; Tue, 14 Jul 2020 06:57:11 +0000
Received: by mail-io1-xd41.google.com with SMTP id a12so16151052ion.13;
 Mon, 13 Jul 2020 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OEqM3Kk6BInJrzhuFtYQ/dCvLcq7Qh6rb6FLoHzVLzc=;
 b=Donu1wjoXrQsX1pILpkkyA0rN0SQQTpxz6CGP0MR07pL/HUwu/JQuRi5dDk4uYNyUZ
 lAwnTEg/So2Z5k99tAC3ApWctA/ORGiUZANJFXoJ8WzRmxQ5MdruWGb9BilR0hjIovnx
 s5D1mCFKe9Ao45I1LD2U7TP+vwe28+LRLjl5MhqaJ70V2+IG0M3UbWDe2z600+SScVrO
 Tygva+yv/Opp4BTuM5+Nmn+pkQD9o1pptZNDkLzSgTb4q5xMtkVXmFa1h49w5SduLLhJ
 LOK/ees8J3YW2O636JX+0WvfPZf3Yp5GfivpFTDroufTIaZk1amlbxeE7hzzZpFh20V+
 7UFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OEqM3Kk6BInJrzhuFtYQ/dCvLcq7Qh6rb6FLoHzVLzc=;
 b=e2s07dlnCNGXWSCaFGN2vUycPIRzw09u09sKHy2zoWTFULRg0XlxoGz1W0dgsvlrPR
 K7M0qkfIpOfrjxvkjne3ZbIcR97iLCk+jO1OLga4MLGD+B7BUKBCdY9eiJhrIDP4SeE2
 ZnjTVBWGaVyKZjxfcTTclWdZwpwDeDb9TTyYbt7gzIFxdFh+dDZU0xxJXLHno8ygW5+D
 5Ycfd03eyg+C+8mw668cnjlClU/AElYAWPGUm+Hj+gm4IDEVn7WI86zJCcJ9RN2L93Al
 jJm5cUGUyV/xQu1WQ9r/OTSl3Glf86dyEYOmf6JTUdMIzU+66q8isiQLhLuxJMSypwIO
 qj5w==
X-Gm-Message-State: AOAM5305kiopa29wPlyKpmeYB7eh0QfGXBvz1r45UbupUhomi56GZ2tp
 S8/+Glr6fLZXrytSfOXSoVcuDxJe9P/c2Pn3ZYg=
X-Google-Smtp-Source: ABdhPJzxFLyzZSkmMi6sKjYolxyBPfiL3C7xSHANSDOzO4iRPPIcOKQ2TcpdMziW9tRf6lkZpJDJJ7ux1WaNfGSrDuU=
X-Received: by 2002:a05:6638:164a:: with SMTP id
 a10mr4476273jat.126.1594709828951; 
 Mon, 13 Jul 2020 23:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com>
In-Reply-To: <20200713160522.19345-1-dan@dlrobertson.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Jul 2020 12:26:57 +0530
Message-ID: <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
To: Dan Robertson <dan@dlrobertson.com>
Content-Type: multipart/mixed; boundary="000000000000e00ede05aa6150f0"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_025711_123832_2780C558 
X-CRM114-Status: GOOD (  25.14  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--000000000000e00ede05aa6150f0
Content-Type: text/plain; charset="UTF-8"

hi Dan,

On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com> wrote:
>
> When testing suspend for another driver I noticed the following warning:
>
> WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
> Hardware name: Hardkernel ODROID-N2 (DT)
> [..]
> pc : reset_control_assert+0x184/0x19c
> lr : dwc3_meson_g12a_suspend+0x68/0x7c
> [..]
> Call trace:
>  reset_control_assert+0x184/0x19c
>  dwc3_meson_g12a_suspend+0x68/0x7c
>  platform_pm_suspend+0x28/0x54
>  __device_suspend+0x590/0xabc
>  dpm_suspend+0x104/0x404
>  dpm_suspend_start+0x84/0x1bc
>  suspend_devices_and_enter+0xc4/0x4fc
>
> In my limited experience and knowlege it appears that we hit this
> because the reset control was switched to shared and the the use
> of the reset control was not changed.
>
> > * Calling reset_control_assert without first calling reset_control_deassert
> > * is not allowed on a shared reset control. Calling reset_control_reset is
> > * also not allowed on a shared reset control.
>
> The above snippet from reset_control_get_shared() seems to indicate that
> this is due to the use of reset_control_reset() in dwc3_meson_g12a_probe()
> and reset_control_deassert is not guaranteed to have been called
> before dwc3_meson_g12a_suspend() and reset_control_assert().
>
> After some basic tests with the following patch I no longer hit the
> warning. Comments and critiques on the patch are welcome. If there is a
> reason for the current use of the reset control, I'd love to learn why!
> Like I said before, I have not really looked at this driver before and
> have verify limited experience with reset controls... Was working on
> another driver, hit the warning, and thought I'd take a shot at the
> fix :-)
>
Thanks, I was also looking into this issue
So best Fix to this issue is to drop the call of reset_control_assert
from dwc3_meson_g12a_suspend
and drop the call of reset_control_deassert from dwc3_meson_g12a_resume
With these changes we do not see the warning on suspend and resume

Can you try this attached patch?

Best Regards
-Anand

--000000000000e00ede05aa6150f0
Content-Type: application/octet-stream; 
	name="0001-usb-dwc3-meson-g12a-drop-reset-controller-call-from-.patch"
Content-Disposition: attachment; 
	filename="0001-usb-dwc3-meson-g12a-drop-reset-controller-call-from-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kclkz4tk0>
X-Attachment-Id: f_kclkz4tk0

RnJvbSA4NDE1MDBjNzg0YWM1MjUzZTllYWY5YWZlY2Q2Y2UxMjVlOGJmMWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+CkRh
dGU6IFR1ZSwgMTQgSnVsIDIwMjAgMTI6MTM6MTcgKzA1MzAKU3ViamVjdDogW1BBVENIXSB1c2I6
IGR3YzM6IG1lc29uLWcxMmE6IGRyb3AgcmVzZXQgY29udHJvbGxlciBjYWxsIGZyb20KIHN1c3Bl
bmQgYW5kIHJlc3VtZQoKRHJvcCB0aGUgcmVzZXQgY29udHJvbGxlciBjYWxsIGZyb20gc3VzcGVu
ZCBhbmQgcmVzdW1lLgoKU2lnbmVkLW9mZi1ieTogQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMgfCA0IC0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24tZzEy
YS5jCmluZGV4IDFmN2Y0ZDg4ZWQ5ZC4uMGMwZWE1NTIxNWNiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtbWVzb24tZzEyYS5jCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1t
ZXNvbi1nMTJhLmMKQEAgLTg3Niw4ICs4NzYsNiBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IGR3YzNfbWVzb25fZzEyYV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJcGh5X2V4aXQo
cHJpdi0+cGh5c1tpXSk7CiAJfQogCi0JcmVzZXRfY29udHJvbF9hc3NlcnQocHJpdi0+cmVzZXQp
OwotCiAJcmV0dXJuIDA7CiB9CiAKQEAgLTg4Niw4ICs4ODQsNiBAQCBzdGF0aWMgaW50IF9fbWF5
YmVfdW51c2VkIGR3YzNfbWVzb25fZzEyYV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCXN0
cnVjdCBkd2MzX21lc29uX2cxMmEgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAlpbnQg
aSwgcmV0OwogCi0JcmVzZXRfY29udHJvbF9kZWFzc2VydChwcml2LT5yZXNldCk7Ci0KIAlyZXQg
PSBwcml2LT5kcnZkYXRhLT51c2JfaW5pdChwcml2KTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwotLSAKMi4yNS4xCgo=
--000000000000e00ede05aa6150f0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--000000000000e00ede05aa6150f0--

