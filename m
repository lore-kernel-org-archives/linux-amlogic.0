Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56037C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XinAqtNtlDCDhdXj9mXXPkczoIlf0inIJr4F2q6ZzsA=; b=pyfLJnwomCt1Qs
	tvBouRVIH+TwtitMLwGzq74oeTbqcKOFmhSsWR7jOOkq2/X9GO4x0F06e9HNKiVaXgT7YZnoQGK9t
	s9ixf8HnQb9jvKQhYhMBJcwusQiMO0nSPqSEVdcdTrrEvjWIvj4Cu81ASuAIBOj+b3rQT6dUqOiy3
	C+8GsewZEJ21uLYeaC7Bw4Pwk9Z3T8aW3/Zkkv+Wg4+lN/fBaAWfhZKmq8JZ4+goSa1BuP38Df4Ws
	iL9On60/OD2bcY2PFw0xvso0YzZmzyYNhuLUnWb6Krkhpb4wPLzDrQeUNrKp6ssf0Es6ufiTc8AbS
	r6LIDbgRCEVzYteO5yAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyCl-00Fgdc-Dg; Tue, 01 Mar 2022 08:49:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyCf-00FgZs-Qr
 for linux-amlogic@lists.infradead.org; Tue, 01 Mar 2022 08:49:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id x5so20985288edd.11
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Mar 2022 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=XXHAzHSUKx1FZRpzOVh0FkOoc+KpTYgeqdRYpbFwNrY=;
 b=F+esdrn2u/7IDUUa1QkHWhRVrp8WFnBvGjuqIGJHuagwFCGXLVP7vSZU2U3+wERsQT
 fWvJ+xVv29r9Vrmb9tn5rHED5cU1X8tK2CqfvV6RM7ezsNCdpa2It3cm4FlFR47szVMA
 eCVvAxQXUxdGb0T/KPMTEqz/zILzvrx4TfoVmIeR9sr3xkFKjk0FSai0zNLjIqNh5sn+
 fN7DjLfFSGC311dIGwM3xCmkbA+CJ1cOM9qaZ/yG4C4X3O31AX151x7loCW6uKWMF9W6
 WUL5RqWHhqfJFCCTDtQlIVQP7aw4ks1mo9jMmZArFpwcyWc6pxYrEW01WCNfjPO6TnlG
 /IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=XXHAzHSUKx1FZRpzOVh0FkOoc+KpTYgeqdRYpbFwNrY=;
 b=NnrX9gcRxxVZMv4cuWQWtE694Hd0N3azuE22cMY2ED0jiyHZdgMhxu7a9fjz+TbJHo
 SsFGpsqrHmOd65cJRx5njMCO5ZkFcPbYPkNE9qzje6TlgwT8HEGp4o81lCktiB8vZXvT
 9fSt3rJdqDbqdw89Ny1g7If8t+X7O5FqO7TvedZxB0xM9Fhtt0LorYgTQZjXUED2JaPs
 39VbTCZkKZuHJ3h4jJXpug1tYKrndVpI1WbWjR1Gf9EalQsyJQ4TQbGpZU36ty9MJpiV
 yZovL+Y6HsA2wKZvA3fcbhMr5KlyAEdgmLu/O4gQqQhVRsBPnh+bur14FwJaBd5bjbAu
 COkQ==
X-Gm-Message-State: AOAM531bySal7D1EO1tdFg4BdLdFBpU3Fl05ugjvpVdRmpsnZo0Zf8AC
 V6VQEdHnM4dyAxyCow34PoUjRw==
X-Google-Smtp-Source: ABdhPJwwv92nJBUIPZ3wtAe+ZLpDEefHhE/W3cCSrhFs9ZkbcU/booLmLagFYpQio8mA18rbBXJFSQ==
X-Received: by 2002:a05:6402:5207:b0:412:806b:6424 with SMTP id
 s7-20020a056402520700b00412806b6424mr23434103edd.131.1646124592564; 
 Tue, 01 Mar 2022 00:49:52 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a50cf42000000b004135b6eef60sm6931187edk.94.2022.03.01.00.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 00:49:52 -0800 (PST)
References: <20220225073922.3947-1-yu.tu@amlogic.com>
 <1j8rtvxnkv.fsf@starbuckisacylon.baylibre.com>
 <d0da38f1-72c1-d111-2d0d-2bfa2faf1a1d@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V7 0/6] Use CCF to describe the UART baud rate clock
Date: Tue, 01 Mar 2022 09:36:07 +0100
In-reply-to: <d0da38f1-72c1-d111-2d0d-2bfa2faf1a1d@amlogic.com>
Message-ID: <1jilsyvyz9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_004953_900231_F93CF8FE 
X-CRM114-Status: GOOD (  19.47  )
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


On Tue 01 Mar 2022 at 13:54, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Jerome,
>
> On 2022/2/28 18:59, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> 
>> On Fri 25 Feb 2022 at 15:39, Yu Tu <yu.tu@amlogic.com> wrote:
>> 
>>> Using the common Clock code to describe the UART baud rate
>>> clock makes it easier for the UART driver to be compatible
>>> with the baud rate requirements of the UART IP on different
>>> meson chips. Add Meson S4 SoC compatible.
>>>
>>> The test method:
>>> Start the console and run the following commands in turn:
>>> stty -F /dev/ttyAML0 115200 and stty -F /dev/ttyAML0 921600.
>>>
>>> Since most SoCs are too old, I was able to find all the platforms myself
>>> such as Meson6, Meson8, Meson8b, GXL and so on. I only tested it with
>>> G12A and S4.
>> GXL based board are still very common an easy to come by.
>> I'm quite surprised that you are unable to test on this SoC family
> The fact of the matter is that the S4 is our end-2020 chip, the G12A is
> five years old, and the GXL is seven years old. If you must ask for a 
> test, I will report this problem to the leadership to coordinate resources.

The age of the SoC is irrelevant. SoCs don't get deprecated based on age
in mainline. It is not just GXL, same goes for meson8.

These SoCs are actively used. Boards with these SoCs are still sold and
easily available. See the VIM1 or the Libretech boards.

Breaking things for the the users of these SoCs is not acceptable.
So yes, looking at your series, I strongly recommend you do more tests.

>> 
>>>
>>> Yu Tu (6):
>>>    tty: serial: meson: Move request the register region to probe
>>>    tty: serial: meson: Use devm_ioremap_resource to get register mapped
>>>      memory
>>>    tty: serial: meson: Describes the calculation of the UART baud rate
>>>      clock using a clock frame
>>>    tty: serial: meson: Make some bit of the REG5 register writable
>>>    tty: serial: meson: The system stuck when you run the stty command on
>>>      the console to change the baud rate
>>>    tty: serial: meson: Added S4 SOC compatibility
>>>
>>> V6 -> V7: To solve the system stuck when you run the stty command on
>>> the console to change the baud rate.
>>> V5 -> V6: Change error format as discussed in the email.
>>> V4 -> V5: Change error format.
>>> V3 -> V4: Change CCF to describe the UART baud rate clock as discussed
>>> in the email.
>>> V2 -> V3: add compatible = "amlogic,meson-gx-uart". Because it must change
>>> the DTS before it can be deleted
>>> V1 -> V2: Use CCF to describe the UART baud rate clock.Make some changes as
>>> discussed in the email
>>>
>>> Link:https://lore.kernel.org/linux-amlogic/20220118030911.12815-4-yu.tu@amlogic.com/
>>>
>>>   drivers/tty/serial/meson_uart.c | 221 ++++++++++++++++++++++----------
>>>   1 file changed, 154 insertions(+), 67 deletions(-)
>>>
>>>
>>> base-commit: a603ca60cebff8589882427a67f870ed946b3fc8
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
