Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2099FC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Dec 2021 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	CC:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIFXywFlrKTb26yjoRX2+ARpsKajeRymkO6qL1gy6dc=; b=hMUqy0LeRMiSHaypK5oAWj0bKR
	2U/e+NaKYZGEW1YdxOThsFR113uw5SfR+5S11WSoYmahRsYpr6AT/KbbuevTFiLC+VpkKYHsKiDi1
	KW9tIvYuhh8tI7sswjeYfMvmCnla6QNn8KvtxB0wfImrS6FnclptoeONx234sLQd3uGxKBhM3sR25
	Ll8XAf67HpHLH8g6bXpt6y8//7SlQUXyr4JRFHgLGyYKBIL0tPORTvcbf8ujjGdNwS69jTnD31caf
	y8P1mesRpXYZyQCmpcNnPDAuzAoHLf75ZdYI0IayffHRER1HvXXZ7/k/InqQ51FfdwrotCU1qy1rK
	CgsPYLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Aal-000o99-Sc; Tue, 28 Dec 2021 11:24:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Aaa-000o6v-LQ; Tue, 28 Dec 2021 11:24:22 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 28 Dec
 2021 19:24:11 +0800
Content-Type: multipart/mixed; boundary="------------pJLNGTZO4iwSOLaQx0LO32SJ"
Message-ID: <36d63dde-6bfc-925b-51ae-ee801dcfa681@amlogic.com>
Date: Tue, 28 Dec 2021 19:24:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 3/3] tty: serial: meson: add UART driver compatible with
 S4 SoC on-chip
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-4-yu.tu@amlogic.com>
 <CAFBinCB9Fre9Lea2CAm_8o8g1e3o8oX4ZONbN_bhykNXoFHDdQ@mail.gmail.com>
 <e041c9ed-ff42-a7e7-2fc5-03c96cc69a88@amlogic.com>
 <CAFBinCAr=U0BM6O329td6=Nw4oknyKQUgTGtwhq4RdCLdR_H+A@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCAr=U0BM6O329td6=Nw4oknyKQUgTGtwhq4RdCLdR_H+A@mail.gmail.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_032420_762055_36448A0D 
X-CRM114-Status: GOOD (  24.87  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--------------pJLNGTZO4iwSOLaQx0LO32SJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin and Jerome，
	Thank you very much for your reply. I have learned a lot from your 
communication.

On 2021/12/28 4:04, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> Hello,
> 
> On Mon, Dec 27, 2021 at 7:56 AM Yu Tu <yu.tu@amlogic.com> wrote:
> [...]
>>> Does the new S4 SoC use an external 12MHz XTAL or does it use a 24MHz XTAL?
>>> If there's still a 24MHz XTAL then I think this description is not
>>> correct - at least based on how I understand the UART controller.
>>>
>> The S4 SoC uses 12MHz(UART_EE_A_REG5[27]=0x1,the bit is set in romcode).
>> This register description is the same as the G12A and G12B you know.
> Thank you for this explanation!
> So the problem is that we're not touching bit 26 and bit 27 - and with
> the updated romcode you would not get any serial output since the
> divider is calculated off the wrong clock.
> 
> I agree with Jerome that we shouldn't put a flag in device-tree.
> 
> Also I did some experimenting with Jerome's idea to implement the
> clocks using CCF (common clock framework), see the attached patches.
> It was a bit tricky because some initial clean-ups were needed in the
> serial driver.
> Note: I have only briefly tested this on a 32-bit Meson8m2 SoC, see my
> attached patches and the clk_summary debugfs output.
> In fact, I expect that there are some issues with at least one of the
> patches as the whole bit 26 and bit 27 code is untested.
> 
> Do you see any problems with this patch?
> Could you try to implement CCF support with the idea from the attached
> patches (you don't need to re-use them, I just wrote them to make it
> clearer in our discussion what we're talking about).
> 
I couldn't agree with you more. I have verified it on a 64-bit S4 
platform. Please refer to the attachment for verification output 
information.
I will prepare the second version of patch according to the example 
ideas you provided.
> 
> Best regards,
> Martin
--------------pJLNGTZO4iwSOLaQx0LO32SJ
Content-Type: text/plain; charset="UTF-8"; name="s4-clk-debug-output.txt"
Content-Disposition: attachment; filename="s4-clk-debug-output.txt"
Content-Transfer-Encoding: base64

77u/IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5IA0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZW5hYmxlICBwcmVwYXJlICBwcm90ZWN0ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkdXR5ICBoYXJkd2FyZQ0KICAgY2xvY2sgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvdW50ICAgIGNvdW50ICAgIGNvdW50ICAgICAgICBy
YXRlICAgYWNjdXJhY3kgcGhhc2UgIGN5Y2xlICAgIGVuYWJsZQ0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIHh0YWwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA3ICAgICAgICA3ICAgICAgICAwICAgIDI0MDAwMDAwICAg
ICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgIGZlMDdhMDAwLnNlcmlhbCN4
dGFsX2RpdjIgICAgICAgICAxICAgICAgICAxICAgICAgICAwICAgIDEyMDAwMDAwICAgICAg
ICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgIGZlMDdhMDAwLnNlcmlhbCN4
dGFsMl9jbGtfc2VsICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICAgMTIwMDAwMDAgICAg
ICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZDQogICAgICAgICAgZmUwN2EwMDAuc2Vy
aWFsI3VzZV94dGFsICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICAgMTIwMDAwMDAgICAg
ICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZDQogICAgICAgICAgICAgZmUwN2EwMDAu
c2VyaWFsI2JhdWRfZGl2ICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICAgICA5MjMwNzcg
ICAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZDQogICAgZmUwN2EwMDAuc2VyaWFs
I3h0YWxfZGl2MyAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAgIDgwMDAwMDAgICAg
ICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZDQogICAgICAgZmUwN2EwMDAuc2VyaWFs
I3h0YWxfY2xrX3NlbCAgICAgICAwICAgICAgICAwICAgICAgICAwICAgICA4MDAwMDAwICAg
ICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KDQojIA0KIyBzdHR5IC1GIC9kZXYv
dHR5QU1MMCAgMTE1MjAwDQoNCiMgc3R0eSAtRiAvZGV2L3R0eUFNTDAgDQpzcGVlZCAxMTUy
MDAgYmF1ZDsgbGluZSA9IDA7DQppbnRyID0gXkM7IHF1aXQgPSBeXDsgZXJhc2UgPSBePzsg
a2lsbCA9IF5VOyBlb2YgPSBeRDsgZW9sID0gPHVuZGVmPjsNCmVvbDIgPSA8dW5kZWY+OyBz
d3RjaCA9IDx1bmRlZj47IHN0YXJ0ID0gXlE7IHN0b3AgPSBeUzsgc3VzcCA9IF5aOyBycHJu
dCA9IF5SOw0Kd2VyYXNlID0gXlc7IGxuZXh0ID0gXlY7IGZsdXNoID0gXk87IG1pbiA9IDE7
IHRpbWUgPSAwOw0KLWJya2ludCBpeG9mZiAtaW1heGJlbA0K

--------------pJLNGTZO4iwSOLaQx0LO32SJ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--------------pJLNGTZO4iwSOLaQx0LO32SJ--

