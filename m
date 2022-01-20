Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D187AC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	CC:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKhC8Fnqd9rEnB1HKzp3vVLJFVwi3brIoH7kjKiz6As=; b=D3zUlNACfN23O7DxAdVLqrWzCs
	sj4hGPbbvY3n2wIvaYznolqjp3n6eRhY/LRnlblyjUfTa/jCeLQrDdj/BgccS8mjbDA/0hDloJgow
	hmOoPUIeUhcXBf6oANsUsk8rep/GwsuLun8Iqb654uLwCbKHNZTVF/e/FXh1SGHsMnj7fOUmZ6KRd
	DWRlAZ0AOUSO6NmV4QdMo54Op6vYYyOPYLZVB+fI6mZtEQJlCkSm2k0q6oyzCnmJJmeMeqdWVGAdR
	teDFTSsgEpSCiQYGSwmhzXKLXsOZ0MDLiwJAeNdaasvfUPVUEsEynGon4LJ39tVxE0Io4QkliL5H7
	/H8cfHJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAT2V-009s7K-TA; Thu, 20 Jan 2022 08:43:27 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAT2G-009s1z-8N; Thu, 20 Jan 2022 08:43:15 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 20 Jan
 2022 16:43:05 +0800
Content-Type: multipart/mixed; boundary="------------q58WCOKn6neNIicBJ4XYn7xz"
Message-ID: <cc3b971f-c630-4ce2-e6dd-c13bcba89d22@amlogic.com>
Date: Thu, 20 Jan 2022 16:43:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V6 0/5] Use CCF to describe the UART baud rate clock
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>, <linux-serial@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <7hfspjqrn7.fsf@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <7hfspjqrn7.fsf@baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_004312_420050_49EA2837 
X-CRM114-Status: GOOD (  14.06  )
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

--------------q58WCOKn6neNIicBJ4XYn7xz
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kevin,
	Thank you very much for your reply.

On 2022/1/20 6:37, Kevin Hilman wrote:
> [ EXTERNAL EMAIL ]
> 
> Hello,
> 
> Yu Tu <yu.tu@amlogic.com> writes:
> 
>> Using the common Clock code to describe the UART baud rate
>> clock makes it easier for the UART driver to be compatible
>> with the baud rate requirements of the UART IP on different
>> meson chips. Add Meson S4 SoC compatible.
> 
> Could you describe how this was tested and on which SoCs?  There seem to
> be some changes in this series that might affect previous SoCs.
> 
For me, the board starts normally and prints. My intention was to add 
the S4 SOC UART compatible, but for the S4 our baud rate clock is 
calculated at 12MHz by default.So a series of changes were made at your 
suggestion.

Since most SoCs are too old, I was able to find all the platforms myself 
such as Meson6, Meson8, Meson8b, GXL and so on. I only tested it with 
G12A and S4.But when I talked to Martin earlier he tried meson8b's log.
The test patch is in the attachment.

I have found that on some boards with this change, the initcall_debug 
Uart driver takes longer to initialize. Running the stty command to 
change the baud rate at the same time may cause a jam.

I'd love to know what else you suggest.

> Thanks,
> 
> Kevin
> 
> 
--------------q58WCOKn6neNIicBJ4XYn7xz
Content-Type: text/plain; charset="UTF-8"; name="g12a-clk-debug-output"
Content-Disposition: attachment; filename="g12a-clk-debug-output"
Content-Transfer-Encoding: base64

77u/IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrLy9jbGtfc3VtbWFyeSB8IGhlYWQNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVuYWJsZSAgcHJlcGFyZSAgcHJvdGVj
dCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHV0eSAgaGFyZHdhcmUNCiAgIGNs
b2NrICAgICAgICAgICAgICAgICAgICAgICAgICBjb3VudCAgICBjb3VudCAgICBjb3VudCAg
ICAgICAgcmF0ZSAgIGFjY3VyYWN5IHBoYXNlICBjeWNsZSAgICBlbmFibGUNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiB4dGFsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgNiAgICAgICAgNiAgICAgICAgMCAgICAyNDAw
MDAwMCAgICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkNCiAgICBmZjgwMzAwMC5z
ZXJpYWwjeHRhbF9kaXYgICAgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAgICAxMjAwMDAw
MCAgICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkNCiAgICAgICBmZjgwMzAwMC5z
ZXJpYWwjdXNlX3h0YWwgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAgICAxMjAwMDAwMCAg
ICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkNCiAgICAgICAgICBmZjgwMzAwMC5z
ZXJpYWwjYmF1ZF9kaXYgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAgICAgIDExNTM4NSAg
ICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkNCiAgICBjdHNfb3NjaW4gICAgICAg
ICAgICAgICAgICAgICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAyNDAwMDAwMCAgICAg
ICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkNCiAgICAgICBnMTJhX2FvX2NlY19wcmUg
ICAgICAgICAgICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAyNDAwMDAwMCAgICAgICAg
ICAwICAgICAwICA1MDAwMCAgICAgICAgIE4NCiAgICAgICAgICBnMTJhX2FvX2NlY19kaXYg
ICAgICAgICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgICAzMjc0MiAgICAgICAgICAw
ICAgICAwICA1MDAwMCAgICAgICAgIFkNCg==
--------------q58WCOKn6neNIicBJ4XYn7xz
Content-Type: text/plain; charset="UTF-8"; name="clk-debug-output.txt"
Content-Disposition: attachment; filename="clk-debug-output.txt"
Content-Transfer-Encoding: base64

IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5IAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlbmFibGUgIHByZXBhcmUgIHByb3RlY3QgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGR1dHkgIGhhcmR3YXJlCiAgIGNsb2NrICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb3VudCAgICBjb3VudCAgICBjb3VudCAgICAgICAgcmF0ZSAg
IGFjY3VyYWN5IHBoYXNlICBjeWNsZSAgICBlbmFibGUKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpbLi4uXQogeHRhbCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDYgICAgICAgIDYgICAgICAgIDIgICAgMjQwMDAwMDAgICAg
ICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZClsuLi5dCiAgICBjODEwMDRjMC5zZXJp
YWwjeHRhbF9kaXYzICAgICAgICAgMCAgICAgICAgMCAgICAgICAgMCAgICAgODAwMDAwMCAg
ICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkKWy4uLl0KICAgIGZpeGVkX3BsbF9k
Y28gICAgICAgICAgICAgICAgICAgICAxICAgICAgICAxICAgICAgICAwICAyNTUwMDAwMDAw
ICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQogICAgICAgZml4ZWRfcGxsICAg
ICAgICAgICAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgIDI1NTAwMDAwMDAgICAg
ICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZClsuLi5dCiAgICAgICAgICBmY2xrX2Rp
djNfZGl2ICAgICAgICAgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAgIDg1MDAwMDAwMCAg
ICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkKICAgICAgICAgICAgIGZjbGtfZGl2
MyAgICAgICAgICAgICAgICAyICAgICAgICAyICAgICAgICAwICAgODUwMDAwMDAwICAgICAg
ICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQpbLi4uXQogICAgICAgICAgICAgICAgbXBl
Z19jbGtfc2VsICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICA4NTAwMDAwMDAgICAg
ICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCiAgICAgICAgICAgICAgICAgICBtcGVn
X2Nsa19kaXYgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAgIDE0MTY2NjY2NyAgICAgICAg
ICAwICAgICAwICA1MDAwMCAgICAgICAgIFkKICAgICAgICAgICAgICAgICAgICAgIGNsazgx
ICAgICAgICAgIDE3ICAgICAgIDIwICAgICAgICAwICAgMTQxNjY2NjY3ICAgICAgICAgIDAg
ICAgIDAgIDUwMDAwICAgICAgICAgWQpbLi4uXQogICAgICAgICAgICAgICAgICAgICAgICAg
YzgxMDA0YzAuc2VyaWFsI2NsazgxX2RpdjQgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAg
ICAzNTQxNjY2NiAgICAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGM4MTAwNGMwLnNlcmlhbCN1c2VfeHRhbCAgICAgICAxICAg
ICAgICAxICAgICAgICAwICAgIDM1NDE2NjY2ICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAg
ICAgICAgWQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYzgxMDA0YzAuc2VyaWFs
I2JhdWRfZGl2ICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICAgICAxMTUzNjQgICAgICAg
ICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCg==
--------------q58WCOKn6neNIicBJ4XYn7xz
Content-Type: text/plain; charset="UTF-8"; name="s4-clk-debug-output"
Content-Disposition: attachment; filename="s4-clk-debug-output"
Content-Transfer-Encoding: base64

77u/IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5IHwgaGVhZA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5hYmxlICBwcmVwYXJlICBwcm90ZWN0
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkdXR5ICBoYXJkd2FyZQ0KICAgY2xv
Y2sgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50ICAgIGNvdW50ICAgIGNvdW50ICAg
ICAgICByYXRlICAgYWNjdXJhY3kgcGhhc2UgIGN5Y2xlICAgIGVuYWJsZQ0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIHh0YWwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA3ICAgICAgICA3ICAgICAgICAwICAgIDI0MDAw
MDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgIGZlMDdhMDAwLnNl
cmlhbCN4dGFsX2RpdiAgICAgICAgICAxICAgICAgICAxICAgICAgICAwICAgIDEyMDAwMDAw
ICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgIGZlMDdhMDAwLnNl
cmlhbCN1c2VfeHRhbCAgICAgICAxICAgICAgICAxICAgICAgICAwICAgIDEyMDAwMDAwICAg
ICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgIGZlMDdhMDAwLnNl
cmlhbCNiYXVkX2RpdiAgICAgICAxICAgICAgICAxICAgICAgICAwICAgICAgOTIzMDc3ICAg
ICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgIGhkY3AyMl9za3BjbGtfbXV4
ICAgICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwICAgICAg
ICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgIGhkY3AyMl9za3BjbGtfZGl2
ICAgICAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwICAgICAgICAg
IDAgICAgIDAgIDUwMDAwICAgICAgICAgWQ0KICAgICAgICAgIGhkY3AyMl9za3BjbGtfZ2F0
ZSAgICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwICAgICAgICAgIDAg
ICAgIDAgIDUwMDAwICAgICAgICAgTg0K

--------------q58WCOKn6neNIicBJ4XYn7xz
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--------------q58WCOKn6neNIicBJ4XYn7xz--

